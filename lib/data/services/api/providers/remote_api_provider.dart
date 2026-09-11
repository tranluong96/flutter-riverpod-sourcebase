import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/services/api/providers/dio_provider.dart';
import 'package:myapp/data/services/api/rest_api.dart';

final remoteApiProvider = Provider<RestAPI>((ref) {
  return RestAPI(ref.watch(dioProvider));
});
