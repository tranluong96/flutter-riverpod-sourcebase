import 'package:myapp/domain/repositories/app_update_repository.dart';

class SkipUpdateUseCase {
  const SkipUpdateUseCase(this._repository);

  final AppUpdateRepository _repository;

  Future<void> call() => _repository.skipUpdate();
}
