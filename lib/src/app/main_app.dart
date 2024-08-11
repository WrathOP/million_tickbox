import 'package:flutter/material.dart' hide Router;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/util/extension.dart';
import '../core/di/di.dart';
import '../core/router/router.dart';
import '../core/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      fontSizeResolver: (fontSize, instance) => fontSize.toDouble(),
      child: Consumer(
        builder: (context, ref, child) {
          final routerConfig = ref.watch(routerProvider);
          final themeOption = ref.watch(themeProvider);
          return MaterialApp.router(
            title: 'Million Tickbox',
            theme: AppTheme.themeOptions(themeOption),
            darkTheme: AppTheme.darkTheme,
            themeMode: context.themeMode,
            routerConfig: routerConfig,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (BuildContext context, Widget? child) {
              final scale = context.mediaQuery.textScaler.clamp(
                minScaleFactor: 0.5,
                maxScaleFactor: 1,
              );
              return MediaQuery(
                data: context.mediaQuery.copyWith(
                  textScaler: scale,
                ),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
