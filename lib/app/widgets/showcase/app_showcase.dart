import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/widgets/buttons/app_button_outline.dart';
import 'package:myapp/app/widgets/buttons/static_primary_button.dart';
import 'package:showcaseview/showcaseview.dart';

class AppShowcase extends StatelessWidget {
  const AppShowcase({
    super.key,
    required this.showcaseKey,
    required this.title,
    required this.description,
    required this.child,
    this.targetPadding,
    this.targetBorderRadius,
    this.targetShapeBorder,
    this.tooltipPosition,
    this.onSkip,
    this.onNext,
    this.skipLabel = 'スキップ',
    this.nextLabel = 'OK',
  });

  final GlobalKey showcaseKey;
  final String title;
  final String description;
  final Widget child;
  final EdgeInsets? targetPadding;
  final BorderRadius? targetBorderRadius;
  final ShapeBorder? targetShapeBorder;
  final TooltipPosition? tooltipPosition;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final String skipLabel;
  final String nextLabel;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: showcaseKey,
      overlayColor: ResColors().gray_980,
      title: title,
      titleAlignment: Alignment.centerLeft,
      titlePadding: EdgeInsets.only(bottom: 5.h),
      titleTextStyle: ResTextStyles().s12w700.copyWith(
        color: ResColors().yellow_500,
      ),
      targetPadding: targetPadding ?? EdgeInsets.zero,
      targetShapeBorder:
          targetShapeBorder ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
      targetBorderRadius: targetBorderRadius,
      description: description,
      descTextStyle: ResTextStyles().s12w400.copyWith(
        color: ResColors().textHigh,
      ),
      tooltipPosition: tooltipPosition,
      tooltipActionConfig: TooltipActionConfig(
        alignment: MainAxisAlignment.end,
        actionGap: 12.w,
        position: TooltipActionPosition.inside,
      ),
      tooltipActions: [
        TooltipActionButton.custom(
          button: AppButtonOutline(
            height: 34.h,
            width: 90.w,
            onPressed: onSkip ?? () => ShowcaseView.get().dismiss(),
            child: Text(
              skipLabel,
              style: ResTextStyles().s12w700.copyWith(
                color: ResColors().textHigh,
              ),
            ),
          ),
        ),
        TooltipActionButton.custom(
          button: StaticPrimaryButton(
            height: 34.h,
            width: 52.w,
            onPressed: onNext ?? () => ShowcaseView.get().next(),
            child: Text(
              nextLabel,
              style: ResTextStyles().s12w700.copyWith(
                color: ResColors().textHigh,
              ),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
