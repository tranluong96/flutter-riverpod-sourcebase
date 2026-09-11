import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/routers/app_router.dart';
import 'package:myapp/app/widgets/loading_overlay/ui/loading_overlay.dart';
import 'package:myapp/app/widgets/toast_overlay/ui/toast_overlay_widget.dart';
import 'package:myapp/i18n/strings.g.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: MaterialApp.router(
        title: 'myapp',
        routerConfig: router.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: _inputDecorationTheme(context),
          fontFamily: 'NotoSansJP',
          scaffoldBackgroundColor: ResColors().white,
          primaryColor: ResColors().white,
          primarySwatch: Colors.orange,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: TranslationProvider.of(context).flutterLocale,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: ScreenUtilInit(
              designSize: const Size(390, 844),
              enableScaleText: () => false,
              enableScaleWH: () => true,
              ensureScreenSize: true,
              builder: (_, _) => Stack(
                children: [
                  child!,
                  const LoadingOverlay(),
                  const ToastOverlayWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

InputDecorationTheme _inputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    fillColor: ResColors().white,
    filled: true,
    hintStyle: ResTextStyles().s14w400.copyWith(color: ResColors().black_25),
    labelStyle: ResTextStyles().s14w400.copyWith(color: ResColors().gray_900),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
        color: ResColors().neutral_200,
        style: BorderStyle.solid,
      ),
    ),
    contentPadding: const EdgeInsets.all(12),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: ResColors().primary_400,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: ResColors().red_500,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: ResColors().primary_400,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: ResColors().neutral_200,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
    errorMaxLines: 3,
  );
}
