import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/ui/widgets/buttons/outline_button_custom.dart';
import 'package:myapp/ui/main/setting/view_models/setting_view_model.dart';
import 'package:myapp/i18n/strings.g.dart';

class UserDeleteAccountButton extends StatelessWidget {
  const UserDeleteAccountButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlineButtonCustom(
      onPressed: onPressed,
      borderColor: ResColors().red400,
      color: ResColors().red100,
      child: Text(
        context.t.common.deleted_account,
        style: ResTextStyles().s18w500.copyWith(color: ResColors().red400),
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
      settingViewModelProvider.select((s) => s.isLoading),
    );
    return OutlineButtonCustom(
      onPressed: isLoading ? null : onPressed,
      borderColor: ResColors().gray350,
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
