import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/utils/network/network.dart';
import 'package:myapp/ui/widgets/toast/toast_helper.dart';
import 'package:myapp/i18n/strings.g.dart';

@RoutePage()
class AppShellPage extends ConsumerStatefulWidget {
  const AppShellPage({super.key});

  @override
  ConsumerState<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends ConsumerState<AppShellPage>
    with WidgetsBindingObserver {
  late bool init = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<NetworkStatus>(networkProvider, (prev, next) {
      if (prev == NetworkStatus.online && next == NetworkStatus.offline) {
        ToastHelper.showWarning(ref, context.t.network.disconnected);
      }

      if (prev == NetworkStatus.offline && next == NetworkStatus.online) {
        ToastHelper.showSuccess(ref, context.t.network.connected);
      }
    });

    return const AutoRouter();
  }
}
