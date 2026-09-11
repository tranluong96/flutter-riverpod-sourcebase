import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class AppButtonOutline extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final bool disabled;
  final int borderWidth;

  const AppButtonOutline({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderRadius = 8.0,
    this.disabled = false,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !disabled;
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: width,
        height: height ?? 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: borderWidth.w,
            color: borderColor ?? ResColors().neutral_200,
          ),
          color: color ?? ResColors().white,
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: ResColors().gray_500.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
