import 'package:myapp/data/models/user/user_response.dart';
import 'package:myapp/data/services/api/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  /// Auth
  @POST(Endpoints.loginAPI)
  Future<UserResponse> loginAPI(
    @Body() String input,
    @CancelRequest() CancelToken? cancelToken,
  );

  /// Others
}
