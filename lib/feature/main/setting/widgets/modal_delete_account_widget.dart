import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/core/utils/base_dialog_widget.dart';
import 'package:myapp/app/widgets/buttons/app_button_outline.dart';
import 'package:myapp/app/widgets/buttons/primary_button.dart';
import 'package:myapp/i18n/strings.g.dart';

class ModalDeleteAccountWidget extends ConsumerWidget {
  final VoidCallback onDelete;
  const ModalDeleteAccountWidget({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialogWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.t.common.logout,
            textAlign: TextAlign.center,
            style: ResTextStyles().s16w600.copyWith(
              color: ResColors().textHigh,
            ),
          ).paddingOnly(bottom: 4.h),
          Text(
            context.t.common.confirm,
            textAlign: TextAlign.center,
            style: ResTextStyles().s14w400.copyWith(color: ResColors().textLow),
          ),
          AppButtonOutline(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            color: ResColors().red_100,
            borderColor: ResColors().red_400,
            child: Text(
              context.t.common.deleted_account,
              style: ResTextStyles().s18w500.copyWith(
                color: ResColors().red_400,
              ),
            ),
          ).paddingOnly(top: 16.h, bottom: 12.h),
          PrimaryButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              context.t.common.cancel,
              style: ResTextStyles().s18w700.copyWith(
                color: ResColors().textHigh,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
