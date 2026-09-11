import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/domain/use_cases/skip_update_use_case.dart';
import '../../fakes/repositories/fake_app_update_repository.dart';

void main() {
  test('delegates skip update to the repository contract', () async {
    final repository = FakeAppUpdateRepository();
    final useCase = SkipUpdateUseCase(repository);

    await useCase();

    expect(repository.wasCalled, isTrue);
  });
}
