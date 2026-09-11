import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/app/core/enums/enums.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(StatusState.idle) StatusState status,
    @Default("") String employeeId,
    @Default("") String password,
    @Default(null) String? errorValidation,
  }) = _LoginState;

  const LoginState._();
}
