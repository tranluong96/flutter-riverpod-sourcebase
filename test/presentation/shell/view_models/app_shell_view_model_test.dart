import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/providers/app_providers.dart';
import 'package:myapp/domain/use_cases/skip_update_use_case.dart';
import 'package:myapp/presentation/shell/view_models/app_shell_view_model.dart';

import '../../../fakes/repositories/fake_app_update_repository.dart';

void main() {
  test(
    'skipUpdate calls the use case and updates presentation state',
    () async {
      final repository = FakeAppUpdateRepository();
      final container = ProviderContainer.test(
        overrides: [
          skipUpdateUseCaseProvider.overrideWithValue(
            SkipUpdateUseCase(repository),
          ),
        ],
      );

      await container.read(appShellViewModelProvider.notifier).skipUpdate();

      expect(repository.wasCalled, isTrue);
      expect(container.read(appShellViewModelProvider).doNotShowAgain, isTrue);
    },
  );
}
