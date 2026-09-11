import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class VerificationCodeField extends StatefulWidget {
  final CodeDigit codeDigit;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final TextStyle? textStyle;
  final bool? filled;
  final Color? fillColor;
  final bool autoFocus;

  const VerificationCodeField({
    super.key,
    this.codeDigit = CodeDigit.four,
    this.onSubmit,
    this.onChanged,
    this.enabled,
    this.textStyle,
    this.filled,
    this.fillColor,
    this.autoFocus = true,
  });

  @override
  State<VerificationCodeField> createState() => _VerificationCodeFieldState();
}

class _VerificationCodeFieldState extends State<VerificationCodeField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  int get _length => widget.codeDigit.digit;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    widget.onChanged?.call(value);

    if (value.length == _length) {
      widget.onSubmit?.call(value);
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = _controller.text;

    return GestureDetector(
      onTap: () {
        if (widget.enabled ?? true) {
          _focusNode.requestFocus();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Hidden TextField

          /// Visible Boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_length, (index) {
              final isFilled = index < text.length;
              final isActive = _focusNode.hasFocus && text.length == index;

              final displayChar = isFilled ? text[index] : '';

              Color borderColor;

              if (_focusNode.hasFocus) {
                if (isActive || isFilled) {
                  borderColor = ResColors().primary_400;
                } else {
                  borderColor = ResColors().neutral_100;
                }
              } else {
                // UNFOCUS
                if (text.isEmpty) {
                  borderColor = ResColors().neutral_100; // default border
                } else {
                  borderColor = ResColors().primary_400;
                }
              }

              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: HPaddingSize.w6),
                    width: VDoubleSize.h60,
                    height: VDoubleSize.h60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.filled ?? true
                          ? (isFilled
                                ? widget.fillColor ?? ResColors().primary_50
                                : ResColors().gray_100)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(DoubleSizeExt.s12),
                      border: Border.all(color: borderColor, width: 1.5),
                    ),
                    child: Text(
                      displayChar,
                      style:
                          widget.textStyle ??
                          TextStyle(
                            fontSize: VDoubleSize.h24,
                            fontWeight: FontWeight.bold,
                            color: ResColors().gray_900,
                          ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Opacity(
            opacity: 0,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              keyboardType: TextInputType.number,
              maxLength: _length,
              autofillHints: const [AutofillHints.oneTimeCode],
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: _onChanged,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Enum to represent the number of digits for the Verification Code.
enum CodeDigit {
  four(4),
  five(5),
  six(6);

  const CodeDigit(this.digit);
  final int digit;
}
