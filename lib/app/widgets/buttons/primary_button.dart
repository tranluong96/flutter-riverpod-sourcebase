import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class PrimaryButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool disabled;
  final bool preventDoubleTap;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.disabled = false,
    this.preventDoubleTap = true,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  DateTime? _lastClickTime;

  void _onTap() {
    if (!widget.preventDoubleTap) {
      widget.onPressed?.call();
      return;
    }
    final now = DateTime.now();
    if (_lastClickTime != null &&
        now.difference(_lastClickTime!) < const Duration(milliseconds: 800)) {
      return;
    }
    _lastClickTime = now;
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled ? null : _onTap,

      child: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? 54.h,
        child: widget.disabled
            ? _buildDisabledButton(context)
            : _buildActiveButton(context),
      ),
    );
  }

  Widget _buildActiveButton(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsetsDirectional.all(HDoubleSize.w4),
          decoration: BoxDecoration(
            color: ResColors().primary,
            borderRadius: BorderRadius.circular(DoubleSizeExt.s4),
          ),
          child: widget.child,
        );
      },
    );
  }

  Widget _buildDisabledButton(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(HPaddingSize.w2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoubleSizeExt.s8),
        border: Border.all(
          color: const Color(0xFFEAEEF2),
          width: HDoubleSize.w2,
        ),
        color: const Color(0xFFD0D7DE),
      ),
      alignment: Alignment.center,
      child: widget.child,
    );
  }
}
