import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/presentation/widgets/toast_overlay/toast_helper.dart';
import 'package:myapp/app/utils/language/provider/language_provider.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/presentation/widgets/language/language_selector_sheet.dart';
import 'package:myapp/presentation/setting/view_models/setting_view_model.dart';
import 'package:myapp/presentation/setting/widgets/modal_delete_account_widget.dart';
import 'package:myapp/presentation/setting/widgets/user_action_buttons_widget.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<SettingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
    });
  }

  Future<void> _logout() async {
    final didLogout = await ref
        .read(settingViewModelProvider.notifier)
        .logout();
    if (!didLogout) {
      final message = ref.read(settingViewModelProvider).apiErrorMessage;
      if (message.isNotEmpty) ToastHelper.showError(ref, message);
      return;
    }
    if (mounted) {
      context.router.replaceAll([const OnboardingRoute()]);
    }
  }

  void _showModalDeleteAccount() {
    showDialog(
      context: context,
      barrierColor: const Color(0xFF32383F).withValues(alpha: 0.7),
      builder: (_) => ModalDeleteAccountWidget(
        onDelete: () async {
          ToastHelper.showError(
            ref,
            ref.read(settingViewModelProvider).apiErrorMessage,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = ref.watch(languageProvider.select((s) => s.localeCode));
    final langLabel = switch (current) {
      'en' => 'English 🇬🇧',
      _ => '日本語 🇯🇵',
    };
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => showLanguageSelector(context, ref),
            borderRadius: BorderRadius.circular(SizeExt.s12),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SizeExt.s16,
                vertical: SizeExt.s14,
              ),
              decoration: BoxDecoration(
                color: ResColors().white,
                borderRadius: BorderRadius.circular(SizeExt.s12),
                border: Border.all(color: ResColors().gray_200),
              ),
              child: Row(
                children: [
                  Icon(Icons.language, color: ResColors().primary, size: 22),
                  const SizedBox(width: SizeExt.s12),
                  Expanded(
                    child: Text(
                      langLabel,
                      style: ResTextStyles().s16w500.copyWith(
                        color: ResColors().textHigh,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: ResColors().textLow,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
          16.h.heightBox,
          UserDeleteAccountButton(onPressed: _showModalDeleteAccount),
          SizedBox(height: 12.h),
          UserLogoutButton(onPressed: _logout),
          SizedBox(height: 32.h),
        ],
      ).paddingHorizontal(16),
    );
  }
}
