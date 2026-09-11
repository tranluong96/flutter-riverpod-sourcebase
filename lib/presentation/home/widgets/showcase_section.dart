import 'package:flutter/material.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';

/// A titled card used to group related design-system samples on the
/// showcase (Home) screen. Gives every section the same visual rhythm so a
/// developer can immediately tell where one component group ends and the
/// next begins.
class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
  });

  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: DoubleSizeExt.s16),
      padding: const EdgeInsets.all(DoubleSizeExt.s16),
      decoration: BoxDecoration(
        color: ResColors().white,
        borderRadius: BorderRadius.circular(DoubleSizeExt.s16),
        border: Border.all(color: ResColors().gray_200),
        boxShadow: [
          BoxShadow(
            color: ResColors().black_06,
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ResTextStyles().s16w700.copyWith(
              color: ResColors().textHigh,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: DoubleSizeExt.s2),
            Text(
              subtitle!,
              style: ResTextStyles().s12w400.copyWith(
                color: ResColors().textLow,
              ),
            ),
          ],
          const SizedBox(height: DoubleSizeExt.s16),
          child,
        ],
      ),
    );
  }
}
