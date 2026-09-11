import 'package:flutter/material.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/data/models/auth/employee_request.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/domain/models/auth/session_model.dart';
import 'package:myapp/domain/use_cases/auth/auth_use_case.dart';
import 'package:myapp/ui/auth/login/view_models/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return const LoginState();
  }

  // ======================
  // ACTIONS
  // ======================

  void setEmployeeId(String p0) {
    state = state.copyWith(employeeId: p0.trim(), errorValidation: null);
  }

  void setPassword(String p0) {
    state = state.copyWith(password: p0.trim(), errorValidation: null);
  }

  Future<void> onSubmitLogin(BuildContext context) async {
    if (state.employeeId.isEmpty || state.password.isEmpty) {
      state = state.copyWith(
        errorValidation: "Please enter fields ID or Password!",
      );
      return;
    }
    try {
      final appPrefs = ref.read(appPrefsProvider);
      final authUseCase = ref.read(authUseCaseProvider);
      state = state.copyWith(status: StatusState.loading);
      final authSession = appPrefs.getSession();
      final input = EmployeeRequest(
        companyCode: (authSession?.companyCode).toContent,
        deviceId: (authSession?.deviceId).toContent,
        loginId: state.employeeId,
        employeePassword: state.password,
      );
      final res = await authUseCase.login(input);
      await appPrefs.saveSession(
        SessionModel(
          companyCode: input.companyCode,
          deviceId: input.deviceId,
          token: (res.token).toContent,
        ),
      );
      state = state.copyWith(status: StatusState.success);
    } catch (e) {
      state = state.copyWith(status: StatusState.error);
    }
  }
}
