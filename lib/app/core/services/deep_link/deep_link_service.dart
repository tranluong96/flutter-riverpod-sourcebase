import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:myapp/app/app.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';

final deepLinkServiceProvider = Provider<DeepLinkService>((ref) {
  return DeepLinkService(ref);
});

class DeepLinkService {
  final Ref _ref;
  final _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  static const _consumedKey = '_deep_link_consumed_uri';

  // Stored until AppShell is mounted and ready
  Uri? _pendingInitialUri;

  DeepLinkService(this._ref);

  Future<void> init() async {
    // Read initial link (cold start / terminated state)
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        // Check if this exact URI was already processed (survives hot restart
        // since SharedPreferences persists across Dart VM restarts)
        final prefs = _ref.read(sharedPrefsProvider);
        final lastConsumed = prefs.getString(_consumedKey);
        if (lastConsumed != initialLink.toString()) {
          _pendingInitialUri = initialLink;
          await prefs.setString(_consumedKey, initialLink.toString());
          if (kDebugMode) {
            print('=== DEEP LINK (initial stored): $initialLink ===');
          }
        } else {
          if (kDebugMode) {
            print('=== DEEP LINK (initial already consumed): $initialLink ===');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) print('DeepLink initial error: $e');
    }

    // app is in background or foreground
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        _handleDeepLink(uri);
      },
      onError: (err) {
        if (kDebugMode) print('DeepLink stream error: $err');
      },
    );
  }

  /// Called from AppShellPage after mount; uses double frame-callbacks to ensure
  /// SplashRoute's replaceAll transition has fully settled before navigating.
  void processPendingLink() {
    if (_pendingInitialUri == null) return;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (_pendingInitialUri != null) {
          final uri = _pendingInitialUri!;
          _pendingInitialUri = null;
          _handleDeepLink(uri);
        }
      });
    });
  }

  void _handleDeepLink(Uri uri) {
    final isLoggedIn = _ref.read(appPrefsProvider).token != null;
    if (!isLoggedIn) return;

    final path = uri.path;
    final host = uri.host;
    // final router = _ref.read(appRouterProvider);

    // Payment Success
    if (path.contains('payment-success') || host.contains('payment-success')) {
      return;
    }

    // Payment Failed
    if (path.contains('payment-failed') || host.contains('payment-failed')) {
      return;
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
