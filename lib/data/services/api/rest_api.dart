import 'package:myapp/data/models/auth/employee_request.dart';
import 'package:myapp/data/models/auth/verify_company_request.dart';
import 'package:myapp/data/models/auth/auth_response.dart';
import 'package:myapp/data/services/api/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  /// Auth
  @POST(Endpoints.verifyCompany)
  Future<AuthResponse> verifyCompanyApi(
    @Body() VerifyCompanyRequest input, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST(Endpoints.loginPath)
  Future<AuthResponse> loginApi(
    @Body() EmployeeRequest input, {
    @CancelRequest() CancelToken? cancelToken,
  });

  /// Others
}
