import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:myapp/presentation/widgets/dialogs/base_dialog_widget.dart';
import 'package:myapp/presentation/widgets/buttons/outline_button_custom.dart';
import 'package:myapp/presentation/widgets/buttons/primary_button.dart';
import 'package:myapp/presentation/shell/view_models/app_shell_view_model.dart';

class ModalUpdateAppWidget extends ConsumerWidget {
  const ModalUpdateAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appShellViewModelProvider);
    final texts = context.t.app_update;
    return PopScope(
      canPop: false,
      child: BaseDialogWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.isForceUpdate ? texts.force.title : texts.optional.title,
              textAlign: TextAlign.center,
              style: ResTextStyles().s16w600.copyWith(
                color: ResColors().textHigh,
              ),
            ).paddingOnly(bottom: 4.h),
            Text(
              state.isForceUpdate
                  ? texts.force.message
                  : texts.optional.message,
              textAlign: TextAlign.center,
              style: ResTextStyles().s14w400.copyWith(
                color: ResColors().textLow,
              ),
            ).paddingOnly(bottom: 16.h),
            if (true) ...[
              OutlineButtonCustom(
                onPressed: () async {
                  await ref
                      .read(appShellViewModelProvider.notifier)
                      .skipUpdate();
                  if (context.mounted) Navigator.of(context).pop();
                },
                child: Text(
                  texts.skip,
                  style: ResTextStyles().s18w500.copyWith(
                    color: ResColors().textHigh,
                  ),
                ),
              ),
            ],
            PrimaryButton(
              onPressed: () async {},
              child: Text(
                texts.update,
                style: ResTextStyles().s18w700.copyWith(
                  color: ResColors().textHigh,
                ),
              ),
            ).paddingOnly(top: 12.h),
          ],
        ),
      ),
    );
  }
}
