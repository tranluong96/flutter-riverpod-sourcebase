// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/widgets/toast_overlay/provider/toast_overlay_provider.dart';

class ToastOverlayWidget extends HookConsumerWidget {
  const ToastOverlayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueAsync = ref.watch(toastOverlayProvider);

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    // Listen to state change
    useEffect(() {
      valueAsync.whenOrNull(
        data: (message) {
          if (message != null) {
            controller.forward();
          } else {
            controller.reverse();
          }
        },
      );
      return null;
    }, [valueAsync]);

    return valueAsync.when(
      data: (value) {
        if ((value?.message ?? '').isEmpty) return const SizedBox.shrink();
        final isSuccess = (value?.status ?? EToastType.error).isSuccess;
        final isWarning = (value?.status ?? EToastType.error).isWarning;
        final bgColor = isSuccess
            ? ResColors().green_600
            : isWarning
            ? ResColors().primary_400
            : ResColors().red_500;
        final borderColor = isSuccess
            ? ResColors().green_600
            : isWarning
            ? ResColors().yellow_300
            : ResColors().red_600;

        return Positioned(
          top: 50.h,
          left: 16.w,
          right: 16.w,
          child: FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(animation),
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    ref.read(toastOverlayProvider.notifier).hide();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: bgColor,
                          child: Icon(
                            isSuccess
                                ? Icons.check
                                : isWarning
                                ? Icons.info_outline_rounded
                                : Icons.warning_amber_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            (value?.message ?? '').toContent,
                            style: ResTextStyles().s14w500.copyWith(
                              color: ResColors().white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
