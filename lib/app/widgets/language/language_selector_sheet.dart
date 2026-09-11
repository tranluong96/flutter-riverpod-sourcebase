import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/double_size_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/core/utils/bottomsheet_utils.dart';
import 'package:myapp/app/language/provider/language_provider.dart';
import 'package:myapp/i18n/strings.g.dart';

/// One selectable language option shown in the selector sheet.
class _LanguageOption {
  const _LanguageOption(this.code, this.label, this.flag);
  final String code;
  final String label;
  final String flag;
}

const _languages = <_LanguageOption>[
  _LanguageOption('ja', '日本語', '🇯🇵'),
  _LanguageOption('en', 'English', '🇬🇧'),
];

/// Opens a bottom sheet that lets the user switch the app language.
///
/// Reused across the app (Showcase / My Page) so every screen changes the
/// locale through the exact same UI and code path.
Future<void> showLanguageSelector(BuildContext context, WidgetRef ref) {
  return context.showBottomSheetAutoHeight(
    child: Consumer(
      builder: (context, ref, _) {
        final current = ref.watch(languageProvider.select((s) => s.localeCode));
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            DoubleSizeExt.s16,
            DoubleSizeExt.s12,
            DoubleSizeExt.s16,
            DoubleSizeExt.s24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: ResColors().gray_300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: DoubleSizeExt.s16),
              Text(
                context.t.common.language,
                style: ResTextStyles().s18w700.copyWith(
                  color: ResColors().textHigh,
                ),
              ),
              const SizedBox(height: DoubleSizeExt.s12),
              ..._languages.map(
                (lang) => _LanguageTile(
                  option: lang,
                  selected: lang.code == current,
                  onTap: () {
                    ref
                        .read(languageProvider.notifier)
                        .changeLanguage(lang.code);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final _LanguageOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(DoubleSizeExt.s12),
      child: Container(
        margin: const EdgeInsets.only(bottom: DoubleSizeExt.s8),
        padding: const EdgeInsets.symmetric(
          horizontal: DoubleSizeExt.s16,
          vertical: DoubleSizeExt.s14,
        ),
        decoration: BoxDecoration(
          color: selected ? ResColors().primary_50 : ResColors().white,
          borderRadius: BorderRadius.circular(DoubleSizeExt.s12),
          border: Border.all(
            color: selected ? ResColors().primary_400 : ResColors().gray_200,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(option.flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: DoubleSizeExt.s12),
            Expanded(
              child: Text(
                option.label,
                style: ResTextStyles().s16w500.copyWith(
                  color: ResColors().textHigh,
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle,
                color: ResColors().primary_400,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
