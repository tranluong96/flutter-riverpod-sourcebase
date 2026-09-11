// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:myapp/feature/main/app_shell/ui/app_shell_page.dart' as _i1;
import 'package:myapp/feature/main/bottom_bar/ui/bottom_bar_page.dart' as _i2;
import 'package:myapp/feature/onboarding_page.dart' as _i3;
import 'package:myapp/feature/splash_page.dart' as _i4;

/// generated route for
/// [_i1.AppShellPage]
class AppShellRoute extends _i5.PageRouteInfo<void> {
  const AppShellRoute({List<_i5.PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppShellPage();
    },
  );
}

/// generated route for
/// [_i2.BottomBarPage]
class BottomBarRoute extends _i5.PageRouteInfo<void> {
  const BottomBarRoute({List<_i5.PageRouteInfo>? children})
    : super(BottomBarRoute.name, initialChildren: children);

  static const String name = 'BottomBarRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomBarPage();
    },
  );
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute({List<_i5.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}
