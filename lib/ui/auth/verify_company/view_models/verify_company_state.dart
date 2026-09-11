import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/app/core/enums/enums.dart';

part 'verify_company_state.freezed.dart';

@freezed
abstract class VerifyCompanyState with _$VerifyCompanyState {
  const factory VerifyCompanyState({
    @Default(StatusState.idle) StatusState status,
    @Default("") String companyCode,
    @Default(null) String? errorInput,
    @Default(false) bool navigateToEmployeeLogin,
    @Default(false) bool navigateToHome,
  }) = _VerifyCompanyState;

  const VerifyCompanyState._();
}
