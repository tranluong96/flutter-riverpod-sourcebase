import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/ui/widgets/buttons/second_button.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: ResColors().white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                SecondButton(
                  onPressed: () {
                    context.router.replaceAll([const AppShellRoute()]);
                  },
                  child: Text(
                    "Login",
                    style: ResTextStyles().s16w600.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
                VerticalSize.h16.heightBox,
                SecondButton(
                  color: ResColors().yellow500,
                  onPressed: () {
                    context.router.replaceAll([const AppShellRoute()]);
                  },
                  child: Text(
                    "Register",
                    style: ResTextStyles().s16w600.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
                VerticalSize.h48.heightBox,
              ],
            ).paddingAll(16.h),
          ),
        ),
      ),
    );
  }
}
