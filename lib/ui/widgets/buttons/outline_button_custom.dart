import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class OutlineButtonCustom extends StatefulWidget {
  final FutureOr<void> Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final bool disabled;
  final double borderWidth;
  final Duration cooldown;

  const OutlineButtonCustom({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = SizeExt.s42,
    this.color,
    this.borderColor,
    this.borderRadius = SizeExt.s8,
    this.disabled = false,
    this.borderWidth = SizeExt.s1,
    this.cooldown = const Duration(milliseconds: 500),
  });

  @override
  State<OutlineButtonCustom> createState() => _OutlineButtonCustomState();
}

class _OutlineButtonCustomState extends State<OutlineButtonCustom> {
  bool _isBusy = false;

  bool get _isEnabled => !widget.disabled && widget.onPressed != null;

  Future<void> _onTap() async {
    final onPressed = widget.onPressed;
    if (onPressed == null) return;

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
    final radius = BorderRadius.circular(widget.borderRadius);

    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            width: widget.borderWidth.r,
            color: (widget.borderColor ?? ResColors().neutral200),
          ),
          color: (widget.color ?? ResColors().white),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: _isEnabled ? _onTap : null,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
