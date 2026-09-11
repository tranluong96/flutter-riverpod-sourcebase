import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/widgets/buttons/app_button_outline.dart';
import 'package:myapp/feature/main/setting/controller/setting_controller.dart';
import 'package:myapp/i18n/strings.g.dart';

class UserDeleteAccountButton extends StatelessWidget {
  const UserDeleteAccountButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButtonOutline(
      onPressed: onPressed,
      borderColor: ResColors().red_400,
      color: ResColors().red_100,
      child: Text(
        context.t.common.deleted_account,
        style: ResTextStyles().s18w500.copyWith(color: ResColors().red_400),
      ),
    );
  }
}

class UserLogoutButton extends ConsumerWidget {
  const UserLogoutButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      settingControllerProvider.select((s) => s.isLoading),
    );
    return AppButtonOutline(
      onPressed: isLoading ? null : onPressed,
      borderColor: ResColors().gray_350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.t.common.logout,
            style: ResTextStyles().s18w500.copyWith(
              color: ResColors().textMiddle,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(Icons.logout_rounded, size: 20.w, color: ResColors().textMiddle),
        ],
      ),
    );
  }
}
