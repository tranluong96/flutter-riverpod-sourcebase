import 'package:flutter/material.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final double borderRadius;
  final bool disabled;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final BoxBorder? border;
  final VoidCallback? onLongPress;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = 42,
    this.color,
    this.borderRadius = 8.0,
    this.disabled = false,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.border,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !disabled;
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      onLongPress: isEnabled ? onLongPress : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? ResColors().blue_400,
          // borderRadius: BorderRadius.circular(borderRadius),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft ?? borderRadius),
            topRight: Radius.circular(topRight ?? borderRadius),
            bottomLeft: Radius.circular(bottomLeft ?? borderRadius),
            bottomRight: Radius.circular(bottomRight ?? borderRadius),
          ),
          border: border,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
