import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myapp/app/configs/env_config.dart';

abstract class Endpoints {
  static final String? baseUrl = dotenv.env[EnvConfig.baseUrl];

  //AUTH
  static const loginAPI = '/api/v1/auth/login';

  static const presignedUrl = '/api/v1/files/generate-presigned-url';

  static const List<String> nonAuthenticatedPaths = [loginAPI];
}
