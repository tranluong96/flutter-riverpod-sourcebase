import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class PrimaryButton extends StatefulWidget {
  final FutureOr<void> Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool disabled;
  final Duration cooldown;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = SizeExt.s42,
    this.borderRadius = SizeExt.s8,
    this.disabled = false,
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
        color: ResColors().primary,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: _isEnabled ? _onTap : null,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: HorizontalSize.w4),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
