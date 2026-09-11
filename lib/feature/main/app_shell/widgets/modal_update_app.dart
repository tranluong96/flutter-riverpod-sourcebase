import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/core/utils/base_dialog_widget.dart';
import 'package:myapp/app/widgets/buttons/app_button_outline.dart';
import 'package:myapp/app/widgets/buttons/primary_button.dart';
import 'package:myapp/feature/main/app_shell/controller/app_shell_controller.dart';

class ModalUpdateAppWidget extends ConsumerWidget {
  const ModalUpdateAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appShellControllerProvider);
    return PopScope(
      canPop: false,
      child: BaseDialogWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.isForceUpdate
                  ? '現在お使いのバージョンはサポート対象外です。'
                  : 'アプリの新しいバージョンが利用可能になりました。',
              textAlign: TextAlign.center,
              style: ResTextStyles().s16w600.copyWith(
                color: ResColors().textHigh,
              ),
            ).paddingOnly(bottom: 4.h),
            Text(
              state.isForceUpdate
                  ? 'アプリを引き続きご利用いただくには、アップデートしてください。'
                  : 'より快適な体験と新機能へのアクセスをご希望の場合は、今すぐアップデートしてください。',
              textAlign: TextAlign.center,
              style: ResTextStyles().s14w400.copyWith(
                color: ResColors().textLow,
              ),
            ).paddingOnly(bottom: 16.h),
            if (true) ...[
              AppButtonOutline(
                onPressed: () {
                  ref.read(appShellControllerProvider.notifier).skipUpdate();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'スキップ',
                  style: ResTextStyles().s18w500.copyWith(
                    color: ResColors().textHigh,
                  ),
                ),
              ),
            ],
            PrimaryButton(
              onPressed: () async {},
              child: Text(
                'アップデート',
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
