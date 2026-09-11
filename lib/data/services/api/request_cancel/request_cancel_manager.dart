// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

/// Central registry of active [CancelToken]s, keyed by a uuid-v4 string.
///
/// Lets controllers abort in-flight requests when their screen/tab is disposed
/// — e.g. switching the bottom tab while a list or an upload is still running —
/// to cut redundant traffic and avoid setState-after-dispose crashes. Use
/// [create] to obtain a token (optionally tagged with a [group]), then
/// [cancel]/[cancelGroup] to abort, or [cancelAll] on logout.
class RequestCancelManager {
  static const _uuid = Uuid();
  final Map<String, _Entry> _tokens = {};

  /// Registers a fresh [CancelToken] under a uuid-v4 [key]. Pass a [group] to
  /// cancel a set of related requests together.
  ({String key, CancelToken token}) create({String? group}) {
    final key = _uuid.v4();
    final token = CancelToken();
    _tokens[key] = _Entry(token, group);
    return (key: key, token: token);
  }

  /// Cancels + deregisters a single token by [key]. No-op if already gone.
  void cancel(String key, [String? reason = 'cancelled']) {
    _tokens.remove(key)?.token.cancel(reason);
  }

  /// Cancels + deregisters every token tagged with [group].
  void cancelGroup(String group, [String? reason = 'cancelled']) {
    _tokens.removeWhere((_, e) {
      if (e.group != group) return false;
      e.token.cancel(reason);
      return true;
    });
  }

  /// Cancels + deregisters everything (e.g. on logout).
  void cancelAll([String? reason = 'cancelled']) {
    for (final e in _tokens.values) {
      e.token.cancel(reason);
    }
    _tokens.clear();
  }

  /// Deregisters a finished token without cancelling, so the map doesn't grow.
  void release(String key) => _tokens.remove(key);
}

class _Entry {
  _Entry(this.token, this.group);
  final CancelToken token;
  final String? group;
}
