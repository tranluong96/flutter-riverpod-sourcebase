import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/i18n/strings.g.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final token = ref.read(appPrefsProvider).token;
      final router = context.router;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!context.mounted) return;
        if (router.current.name != SplashRoute.name) return;
        if (token != null && token.isNotEmpty) {
          router.replaceAll([const AppShellRoute()]);
        } else {
          router.replaceAll([const OnboardingRoute()]);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors().white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120.h,
                  width: 120.h,
                  decoration: BoxDecoration(
                    color: ResColors().primary_50,
                    borderRadius: BorderRadius.circular(28.h),
                  ),
                  child: Icon(
                    Icons.mobile_screen_share_outlined,
                    size: 64.h,
                    color: ResColors().primary,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  context.t.app_name,
                  style: ResTextStyles().s20w700.copyWith(
                    color: ResColors().textHigh,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
