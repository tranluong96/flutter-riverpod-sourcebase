import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/network/controller/network_controller.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/app/widgets/buttons/app_button.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusInternet = ref.read(networkControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: ResColors().white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Icon(
                  statusInternet.isDisConnection
                      ? Icons.wifi_off_outlined
                      : Icons.wifi,
                  size: 48.w,
                  color: ResColors().blue_500,
                ),
                Spacer(),
                AppButton(
                  onPressed: () {
                    context.router.replaceAll([AppShellRoute()]);
                  },
                  child: Text(
                    "Login",
                    style: ResTextStyles().s16w600.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
                16.h.heightBox,
                AppButton(
                  color: ResColors().yellow_500,
                  onPressed: () {
                    context.router.replaceAll([AppShellRoute()]);
                  },
                  child: Text(
                    "Register",
                    style: ResTextStyles().s16w600.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
                50.h.heightBox,
              ],
            ).paddingAll(16.h),
          ),
        ),
      ),
    );
  }
}
