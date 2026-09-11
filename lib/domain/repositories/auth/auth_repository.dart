import 'package:myapp/data/models/auth/employee_request.dart';
import 'package:myapp/data/models/auth/verify_company_request.dart';
import 'package:myapp/domain/models/auth/auth_model.dart';

abstract interface class AuthRepository {
  bool get hasSession;

  Future<AuthModel> verifyCompanyCode(VerifyCompanyRequest input);

  Future<AuthModel> login(EmployeeRequest input);

  // Use for Verify + employee login
  Future<void> saveAuth(AuthModel auth);

  Future<void> logout();
}
