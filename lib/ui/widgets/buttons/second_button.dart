import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class SecondButton extends StatefulWidget {
  final FutureOr<void> Function()? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final double borderRadius;
  final bool disabled;
  final BoxBorder? border;
  final Duration cooldown;

  const SecondButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.width,
    this.height = SizeExt.s42,
    this.color,
    this.borderRadius = SizeExt.s8,
    this.disabled = false,
    this.border,
    this.cooldown = const Duration(milliseconds: 500),
  });

  @override
  State<SecondButton> createState() => _SecondButtonState();
}

class _SecondButtonState extends State<SecondButton> {
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
          color: (widget.color ?? ResColors().blue400),
          borderRadius: radius,
          border: widget.border,
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: _isEnabled ? _onTap : null,
          onLongPress: _isEnabled ? widget.onLongPress : null,
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
