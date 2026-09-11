import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/core/utils/dialog_utils.dart';
import 'package:myapp/app/language/provider/language_provider.dart';
import 'package:myapp/app/widgets/buttons/app_button.dart';
import 'package:myapp/app/widgets/input/app_text_form_field.dart';
import 'package:myapp/app/widgets/language/language_selector_sheet.dart';
import 'package:myapp/app/widgets/loading_overlay/providers/loading_provider.dart';
import 'package:myapp/feature/main/home/widgets/showcase_section.dart';
import 'package:myapp/i18n/strings.g.dart';

/// The Home tab doubles as a living **design-system catalog**. Everything a
/// developer needs to start building a screen — text styles, colors, inputs,
/// buttons, overlays and language switching — is demonstrated here with the
/// exact widgets and helpers they should reuse.
class HomePage extends ConsumerWidget {
  const HomePage({super.key, this.scanKey});

  final GlobalKey? scanKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            DoubleSizeExt.s16,
            DoubleSizeExt.s16,
            DoubleSizeExt.s16,
            DoubleSizeExt.s32,
          ),
          children: [
            Text(
              context.t.common.language,
              style: ResTextStyles().s16w600.copyWith(
                color: ResColors().textHigh,
              ),
            ),
            const SizedBox(height: DoubleSizeExt.s16),
            _LanguageSection(),
            AppButton(
              onPressed: () async {
                ref.read(globalLoadingProvider.notifier).state = true;
                await Future.delayed(Duration(seconds: 1));
                ref.read(globalLoadingProvider.notifier).state = false;
              },
              child: Text(
                "Show Loading",
                style: ResTextStyles().s14w500.copyWith(
                  color: ResColors().white,
                ),
              ),
            ),
            16.heightBox,
            AppButton(
              onPressed: () async {
                DialogUtil.showAlertDialogUlti(
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
            16.heightBox,
            AppButton(
              onPressed: () async {
                DialogUtil.showConfirmDialogUltis(
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
            16.heightBox,
            AppTextFormField(),
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
    final current = ref.watch(languageProvider.select((s) => s.localeCode));
    final label = switch (current) {
      'en' => 'English 🇬🇧',
      _ => '日本語 🇯🇵',
    };
    return ShowcaseSection(
      title: context.t.app_name,
      subtitle: context.t.hello,
      child: InkWell(
        onTap: () => showLanguageSelector(context, ref),
        borderRadius: BorderRadius.circular(DoubleSizeExt.s12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DoubleSizeExt.s16,
            vertical: DoubleSizeExt.s14,
          ),
          decoration: BoxDecoration(
            color: ResColors().primary_50,
            borderRadius: BorderRadius.circular(DoubleSizeExt.s12),
            border: Border.all(color: ResColors().primary_400),
          ),
          child: Row(
            children: [
              Icon(Icons.language, color: ResColors().primary, size: 22),
              const SizedBox(width: DoubleSizeExt.s12),
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
      ),
    );
  }
}
