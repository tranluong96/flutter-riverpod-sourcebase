import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/i18n/strings.g.dart';

mixin PageEffectMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  void onInit() {}
  void onDispose() {}

  /// Shortcut to access translations with auto-rebuild on locale change.
  /// Equivalent to [Translations.of(context).translations] in build().
  /// Use directly inside build/callbacks: `t.login.title`, `t.error.serverError`, etc.
  Translations get t => Translations.of(context);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      onInit();
    });
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}
