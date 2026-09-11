import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/data/models/auth/verify_company_request.dart';
import 'package:myapp/data/services/device_info/device_infor_service.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/domain/models/auth/session_model.dart';
import 'package:myapp/domain/use_cases/auth/auth_use_case.dart';
import 'package:myapp/ui/auth/verify_company/view_models/verify_company_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_company_view_model.g.dart';

@riverpod
class VerifyCompanyViewModel extends _$VerifyCompanyViewModel {
  @override
  VerifyCompanyState build() {
    return const VerifyCompanyState();
  }

  // ======================
  // ACTIONS
  // ======================

  void setCompanyCode(String value) {
    state = state.copyWith(companyCode: value.trim(), errorInput: null);
  }

  Future<void> _onSubmitVerifyCompanyCode() async {
    try {
      final companyCode = state.companyCode.trim();
      if (companyCode.isEmpty) {
        state = state.copyWith(errorInput: "Company code cannot be empty");
        return;
      }
      final authUseCase = ref.read(authUseCaseProvider);
      final appPrefs = ref.read(appPrefsProvider);
      state = state.copyWith(status: StatusState.loading, errorInput: null);
      final device = await DeviceInfoService.getDeviceInfo();

      final res = await authUseCase.verifyCompanyCode(
        VerifyCompanyRequest(
          companyCode: companyCode,
          deviceId: device.deviceId,
        ),
      );
      await appPrefs.saveSession(
        SessionModel(
          companyCode: companyCode,
          deviceId: device.deviceId,
          token: res.token,
        ),
      );
      state = state.copyWith(
        status: StatusState.success,
        navigateToEmployeeLogin: res.message.toContent.isNotEmpty,
        navigateToHome: res.employeeName.toContent.isNotEmpty,
      );
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(status: StatusState.error);
      }
    }
  }

  void onSubmit() => _onSubmitVerifyCompanyCode;

  void resetState() {
    state = state.copyWith(status: StatusState.idle);
  }
}