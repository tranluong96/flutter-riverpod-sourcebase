import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  /// Others
}
