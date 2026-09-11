import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/configs/env_config.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/providers/app_providers.dart';
import 'package:myapp/app/utils/language/language_service.dart';
import 'package:myapp/app/utils/network/network.dart';
import 'package:myapp/ui/widgets/buttons/outline_button_custom.dart';
import 'package:myapp/ui/widgets/buttons/primary_button.dart';
import 'package:myapp/ui/widgets/dialogs/dialog_utils.dart';
import 'package:myapp/ui/widgets/buttons/second_button.dart';
import 'package:myapp/ui/widgets/input/app_text_form_field.dart';
import 'package:myapp/ui/widgets/language/language_selector_sheet.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:myapp/ui/widgets/toast/toast_helper.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, this.scanKey});

  final GlobalKey? scanKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusInternet = ref.watch(networkProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            SizeExt.s16,
            SizeExt.s16,
            SizeExt.s16,
            SizeExt.s32,
          ),
          children: [
            Row(
              children: [
                Text(
                  "ENV: ${EnvConfig.baseUrl}",
                  style: ResTextStyles().s16w700.copyWith(
                    color: ResColors().textHigh,
                  ),
                ).expanded(),
              ],
            ),
            VerticalSize.h16.heightBox,
            Text(
              context.t.common.language,
              style: ResTextStyles().s16w600.copyWith(
                color: ResColors().textHigh,
              ),
            ),
            VerticalSize.h16.heightBox,
            _LanguageSection(),
            VerticalSize.h16.heightBox,
            Row(
              children: [
                Icon(
                  statusInternet.isDisConnection
                      ? Icons.wifi_off_outlined
                      : Icons.wifi,
                  size: 48.w,
                  color: ResColors().blue500,
                ),
                HorizontalSize.w16.widthBox,
                Text(
                  statusInternet.isDisConnection
                      ? context.t.network.disconnected
                      : context.t.network.connected,
                  style: ResTextStyles().s16w500.copyWith(
                    color: ResColors().textHigh,
                  ),
                ).expanded(),
              ],
            ),
            VerticalSize.h16.heightBox,
            SecondButton(
              onPressed: () async {
                ref.read(appLoadingStateProvider.notifier).state = true;
                await Future.delayed(const Duration(seconds: 1));
                ref.read(appLoadingStateProvider.notifier).state = false;
              },
              child: Text(
                "Show Loading",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            VerticalSize.h16.heightBox,
            SecondButton(
              onPressed: () async {
                await DialogUtil.showAlertDialogUlti(
                  context,
                  title: "Title",
                  message: "Show dialog message!",
                );
              },
              child: Text(
                "Dialog Alert",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            VerticalSize.h16.heightBox,
            SecondButton(
              onPressed: () async {
                await DialogUtil.showConfirmDialogUltis(
                  context,
                  title: "Title",
                  message: "Show dialog confirm!",
                  labelLeft: context.t.common.cancel,
                  labelRight: context.t.common.ok,
                );
              },
              child: Text(
                "Dialog Confirm",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            VerticalSize.h16.heightBox,
            const AppTextFormField(),
            const SizedBox(height: 16),
            // show toast
            PrimaryButton(
              onPressed: () {
                ToastHelper.showSuccess(ref, "Show Success Toast");
              },
              child: Text(
                "Show Success Toast",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            VerticalSize.h16.heightBox,
            SecondButton(
              onPressed: () {
                ToastHelper.showInfor(ref, "Show Information Toast");
              },
              child: Text(
                "Show Information Toast",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            VerticalSize.h16.heightBox,
            OutlineButtonCustom(
              onPressed: () {
                ToastHelper.showError(ref, "Show Error Toast");
              },
              child: Text(
                "Show Error Toast",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().gray900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Language
// ─────────────────────────────────────────────────────────────────────────
class _LanguageSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(
      languageServiceProvider.select((s) => s.localeCode),
    );
    final label = switch (current) {
      'en' => 'English 🇬🇧',
      _ => '日本語 🇯🇵',
    };
    return InkWell(
      onTap: () => showLanguageSelector(context, ref),
      borderRadius: BorderRadius.circular(SizeExt.s12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeExt.s16,
          vertical: SizeExt.s14,
        ),
        decoration: BoxDecoration(
          color: ResColors().primary50,
          borderRadius: BorderRadius.circular(SizeExt.s12.r),
          border: Border.all(color: ResColors().primary400),
        ),
        child: Row(
          children: [
            Icon(Icons.language, color: ResColors().primary, size: 22),
            const SizedBox(width: SizeExt.s12),
            Expanded(
              child: Text(
                label,
                style: ResTextStyles().s16w500.copyWith(
                  color: ResColors().textHigh,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: ResColors().textLow, size: 22),
          ],
        ),
      ),
    );
  }
}
