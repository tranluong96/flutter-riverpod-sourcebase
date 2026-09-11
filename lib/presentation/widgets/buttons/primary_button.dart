import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class PrimaryButton extends StatefulWidget {
  final FutureOr<void> Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool disabled;
  final bool preventDoubleTap;
  final Duration cooldown;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = SizeExt.s42,
    this.borderRadius = SizeExt.s8,
    this.disabled = false,
    this.preventDoubleTap = true,
    this.cooldown = const Duration(milliseconds: 500),
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isBusy = false;

  bool get _isEnabled => !widget.disabled && widget.onPressed != null;

  Future<void> _onTap() async {
    final onPressed = widget.onPressed;
    if (onPressed == null) return;

    if (!widget.preventDoubleTap) {
      onPressed();
      return;
    }

    if (_isBusy) return;
    _isBusy = true;
    try {
      await onPressed();
    } finally {
      await Future<void>.delayed(widget.cooldown);
      _isBusy = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: Material(
        color: _isEnabled ? ResColors().primary : const Color(0xFFD0D7DE),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: _isEnabled ? _onTap : null,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: HorizontalSize.w4),
            decoration: _isEnabled
                ? null
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius.r),
                    border: Border.all(
                      color: const Color(0xFFEAEEF2),
                      width: HorizontalSize.w2,
                    ),
                  ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
