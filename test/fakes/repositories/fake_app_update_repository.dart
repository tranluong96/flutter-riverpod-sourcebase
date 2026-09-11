import 'package:myapp/domain/repositories/app_update_repository.dart';

class FakeAppUpdateRepository implements AppUpdateRepository {
  bool wasCalled = false;

  @override
  Future<void> skipUpdate() async {
    wasCalled = true;
  }
}
