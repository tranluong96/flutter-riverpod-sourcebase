import 'package:auto_route/auto_route.dart';
import 'package:myapp/app/routers/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      duration: const Duration(milliseconds: 300),
    ),

    CustomRoute(
      page: OnboardingRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: const Duration(milliseconds: 300),
    ),

    AutoRoute(
      page: AppShellRoute.page,
      children: [AutoRoute(page: BottomBarRoute.page, initial: true)],
    ),
  ];
}
