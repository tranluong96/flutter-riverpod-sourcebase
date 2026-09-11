import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class BaseDialogWidget extends StatelessWidget {
  const BaseDialogWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(SizeExt.s4),
        margin: const EdgeInsets.symmetric(horizontal: SizeExt.s20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeExt.s20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeExt.s16.r),
            color: ResColors().white,
          ),
          padding: const EdgeInsets.all(SizeExt.s18),
          child: child,
        ),
      ),
    );
  }
}
