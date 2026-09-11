import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/network/cancel/request_cancel_manager.dart';

/// App-lifetime registry of cancelable requests. Plain [Provider] (not
/// autoDispose) so tokens survive across screens until explicitly cancelled.
final requestCancelManagerProvider = Provider<RequestCancelManager>(
  (ref) => RequestCancelManager(),
);
