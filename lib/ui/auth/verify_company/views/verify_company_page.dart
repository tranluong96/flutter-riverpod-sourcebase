import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/ui/auth/verify_company/view_models/verify_company_view_model.dart';
import 'package:myapp/ui/widgets/buttons/primary_button.dart';
import 'package:myapp/ui/widgets/input/app_text_form_field.dart';

@RoutePage()
class VerifyCompanyPage extends ConsumerWidget {
  const VerifyCompanyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Navigate
    ref.listen(verifyCompanyViewModelProvider, (prev, next) {
      if (next.navigateToEmployeeLogin) {
        context.router.replaceAll([const LoginRoute()]);
        return;
      }
      if (next.navigateToHome) {
        context.router.replaceAll([const AppShellRoute()]);
      }
    });

    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(verifyCompanyViewModelProvider);
        final viewModel = ref.read(verifyCompanyViewModelProvider.notifier);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verify Company Code", style: ResTextStyles().s16w600),
                VerticalSize.h24.heightBox,
                AppTextFormField(
                  onChange: (p0) {
                    viewModel.setCompanyCode(p0);
                  },
                  errorText: state.errorInput,
                ),
                VerticalSize.h24.heightBox,
                PrimaryButton(
                  disabled: state.status.isLoading,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    viewModel.onSubmit();
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ).paddingHorizontal(HorizontalSize.w24),
          ),
        );
      },
    );
  }
}
