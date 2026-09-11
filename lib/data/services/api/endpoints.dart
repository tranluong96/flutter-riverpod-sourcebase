import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myapp/configs/env_config.dart';

abstract class Endpoints {
  static final String? baseUrl = dotenv.env[EnvConfig.baseUrl];

  // Authentication
  static const String verifyCompany = "/jupiter_mini/login";
  static const String loginPath = "/jupiter_mini/login_employee";

  static const String presignedUrl = '/jupiter_mini/files/generate-presigned-url';

  static const List<String> nonAuthenticatedPaths = [
    verifyCompany,
    loginPath,
  ];
}
