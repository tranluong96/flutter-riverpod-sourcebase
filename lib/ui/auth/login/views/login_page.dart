import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/app/routers/app_router.gr.dart';
import 'package:myapp/ui/auth/login/view_models/login_view_model.dart';
import 'package:myapp/ui/widgets/buttons/primary_button.dart';
import 'package:myapp/ui/widgets/input/app_text_form_field.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginViewModelProvider, (prev, next) {
      if (next.status.isSuccess) {
        context.router.replaceAll([const AppShellRoute()]);
      }
    });

    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.read(loginViewModelProvider.notifier);
        final state = ref.watch(loginViewModelProvider);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Employee Login", style: ResTextStyles().s16w600),
                VerticalSize.h24.heightBox,
                AppTextFormField(
                  textInputAction: TextInputAction.next,
                  onChange: (p0) {
                    viewModel.setEmployeeId(p0);
                  },
                ),
                VerticalSize.h16.heightBox,
                AppTextFormField(
                  password: true,
                  isObscureText: true,
                  textInputAction: TextInputAction.done,
                  onChange: (p0) {
                    viewModel.setPassword(p0);
                  },
                ),
                VerticalSize.h32.heightBox,
                Visibility(
                  visible: state.errorValidation.toContent.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: VerticalSize.h16),
                    child: Text(
                      state.errorValidation.toContent,
                      style: ResTextStyles().s14w400.copyWith(
                        color: ResColors().red500,
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  disabled: state.status.isLoading,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    viewModel.onSubmitLogin(context);
                  },
                  child: Text(
                    "Submit",
                    style: ResTextStyles().s16w400.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
              ],
            ).paddingHorizontal(HorizontalSize.w32),
          ),
        );
      },
    );
  }
}
