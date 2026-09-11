import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/utils/network/controller/network_controller.dart';
import 'package:myapp/data/services/deep_link/deep_link_service.dart';
import 'package:myapp/presentation/widgets/toast_overlay/toast_helper.dart';
import 'package:myapp/presentation/shell/view_models/app_shell_view_model.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:myapp/presentation/shell/widgets/modal_update_app.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ShowcaseView.register();
      ref.read(deepLinkServiceProvider).processPendingLink();
      ref.read(appShellViewModelProvider.notifier).checkVersion();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<NetworkStatus>(networkControllerProvider, (prev, next) {
      if (prev == NetworkStatus.online && next == NetworkStatus.offline) {
        ToastHelper.showWarning(ref, context.t.network.disconnected);
      }

      if (prev == NetworkStatus.offline && next == NetworkStatus.online) {
        ToastHelper.showSuccess(ref, context.t.network.reconnected);
      }
    });

    ref.listen<bool>(
      appShellViewModelProvider.select((state) => state.shouldShowModal),
      (prev, next) {
        if (next) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const ModalUpdateAppWidget(),
          );
        }
      },
    );

    return const AutoRouter();
  }
}
