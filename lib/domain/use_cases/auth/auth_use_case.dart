import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/models/auth/employee_request.dart';
import 'package:myapp/data/models/auth/verify_company_request.dart';
import 'package:myapp/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:myapp/domain/models/auth/auth_model.dart';
import 'package:myapp/domain/repositories/auth/auth_repository.dart';

class AuthUseCase {
  const AuthUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthModel> verifyCompanyCode(VerifyCompanyRequest input) async {
    try {
      final res = await _repository.verifyCompanyCode(input);
      await _repository.saveAuth(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthModel> login(EmployeeRequest input) async {
    try {
      final res = await _repository.login(input);
      await _repository.saveAuth(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  return AuthUseCase(ref.watch(authRepositoryProvider));
});
