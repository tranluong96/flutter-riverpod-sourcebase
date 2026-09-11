// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final String? initValue;
  final TextEditingController? controller;
  final bool readOnly;
  final TextStyle? style;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final Widget? iconSuffixIcon;
  final Widget? iconPrefixIcon;
  final Function? onActionSuffixIcon;
  final FocusNode? focusNode;
  final String? errorText;
  final int lengthLimiting;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int minLines;
  final double? borderRadius;
  final bool expands;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final bool isNotUseErrorMessage;
  final bool isShowCounterText;
  final Color? enabledBorderColor;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool? password;

  const AppTextFormField({
    super.key,
    this.initValue,
    this.controller,
    this.readOnly = false,
    this.style,
    this.onChange,
    this.onFieldSubmitted,
    this.hintText,
    this.keyboardType,
    this.isObscureText = false,
    this.iconSuffixIcon,
    this.iconPrefixIcon,
    this.onActionSuffixIcon,
    this.focusNode,
    this.errorText,
    this.lengthLimiting = 256,
    this.textInputAction,
    this.maxLines,
    this.minLines = 1,
    this.borderRadius,
    this.expands = false,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.isNotUseErrorMessage = false,
    this.isShowCounterText = false,
    this.enabledBorderColor,
    this.fillColor,
    this.validator,
    this.password,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onActionSuffixIcon() {
    widget.onActionSuffixIcon?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: widget.initValue,
      validator: widget.validator,
      builder: (FormFieldState<String> state) {
        // get error text from validator state or prop
        final errorText = state.errorText ?? widget.errorText;
        final hasError = errorText != null && errorText.isNotEmpty;

        Widget? suffixIcon;
        if (widget.iconSuffixIcon != null) {
          suffixIcon = InkWell(
            onTap: _onActionSuffixIcon,
            child: widget.iconSuffixIcon,
          );
        } else if (widget.isObscureText) {
          suffixIcon = InkWell(
            onTap: _togglePassword,
            child: _obscureText
                ? Icon(Icons.remove_red_eye_outlined, size: DoubleSizeExt.s20)
                : Icon(Icons.close, size: DoubleSizeExt.s20),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              initialValue: widget.initValue,
              style:
                  widget.style ??
                  ResTextStyles().s16w400.copyWith(color: ResColors().textHigh),
              onChanged: (value) {
                state.didChange(value); // update state to validator run again
                widget.onChange?.call(value);
              },

              onFieldSubmitted: widget.onFieldSubmitted,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              cursorColor: ResColors().primary_400,
              obscureText: _obscureText,
              obscuringCharacter: '●',
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              expands: widget.expands,
              textAlign: widget.textAlign,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                fillColor: widget.fillColor ?? ResColors().white,
                hintText: widget.hintText,
                hintStyle: ResTextStyles().s16w400.copyWith(
                  color: ResColors().textLow,
                ),
                errorStyle: const TextStyle(height: 0, fontSize: 0),
                errorText: hasError ? '' : null, // enable red border
                counterText: widget.isShowCounterText
                    ? '${widget.controller?.text.length ?? (state.value?.length ?? 0)}/${widget.lengthLimiting}'
                    : null,
                counterStyle: ResTextStyles().s14w400.copyWith(
                  color: ResColors().gray_600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? DoubleSizeExt.s8),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: widget.enabledBorderColor ?? ResColors().neutral_200,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? DoubleSizeExt.s8),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: widget.readOnly
                        ? ResColors().neutral_100
                        : ResColors().primary_400,
                    style: BorderStyle.solid,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? DoubleSizeExt.s8),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: ResColors().red_500,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? DoubleSizeExt.s8),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: ResColors().primary_400,
                    style: BorderStyle.solid,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: HPaddingSize.w14,
                  vertical: VDoubleSize.h10,
                ),
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: HPaddingSize.w14),
                        child: suffixIcon,
                      )
                    : null,
                prefixIcon: widget.iconPrefixIcon,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: HDoubleSize.w24,
                ),
              ),
              inputFormatters: [
                ...?widget.inputFormatters,
                LengthLimitingTextInputFormatter(widget.lengthLimiting),
              ],
              minLines: widget.expands ? null : widget.minLines,
              maxLines: widget.expands
                  ? null
                  : _obscureText
                  ? 1
                  : widget.maxLines,
            ),
            if (hasError && !widget.isNotUseErrorMessage)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  errorText,
                  style: ResTextStyles().s14w400.copyWith(
                    color: ResColors().red_500,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
