import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';

class FieldWithLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final Widget child;
  final TextStyle? labelStyle;

  const FieldWithLabel({
    super.key,
    required this.label,
    this.isRequired = false,
    required this.child,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style:
                labelStyle ??
                ResTextStyles().s16w700.copyWith(color: ResColors().textMiddle),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: ResTextStyles().s18w500.copyWith(
                    color: ResColors().red_500,
                  ),
                ),
            ],
          ),
        ),
        VDoubleSize.h6.heightBox,
        child,
      ],
    );
  }
}
