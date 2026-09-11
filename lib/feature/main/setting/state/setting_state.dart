import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/app/core/enums/enums.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(false) bool isLoading,
    @Default('') String apiErrorMessage,
    @Default('') String userCode,
    @Default('') String companyCode,
    @Default(Gender.other) Gender gender,
    DateTime? dateOfBirth,
    @Default('') String userName,
    @Default('') String email,
    @Default('') String employeeId,
    @Default(false) bool isEdit,
  }) = _SettingState;
}
