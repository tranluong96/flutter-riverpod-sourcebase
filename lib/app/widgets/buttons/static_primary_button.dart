import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';

class StaticPrimaryButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool preventDoubleTap;

  const StaticPrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.preventDoubleTap = true,
  });

  @override
  State<StaticPrimaryButton> createState() => _StaticPrimaryButtonState();
}

class _StaticPrimaryButtonState extends State<StaticPrimaryButton> {
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
      onTap: _onTap,
      child: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? 54.h,
        child: _buildActiveButton(context),
      ),
    );
  }

  Widget _buildActiveButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.all(HDoubleSize.w4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DoubleSizeExt.s4),

        boxShadow: const [
          BoxShadow(
            color: Color(0x3DFAC215),
            offset: Offset(0, 6),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
