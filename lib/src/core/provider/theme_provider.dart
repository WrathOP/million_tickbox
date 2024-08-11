import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resource/app_keys.dart';
import '../theme/app_theme.dart';

final class ThemeProvider extends StateNotifier<ThemeOptions> {
  ThemeProvider({required this.sharedPreferences})
      : super(
          ThemeOptions.values.firstWhere(
            (theme) =>
                theme.name == sharedPreferences?.getString('currentTheme'),
            orElse: () => ThemeOptions.system,
          ),
        );
  final SharedPreferences? sharedPreferences;

  void setTheme(ThemeOptions themeOption) {
    state = themeOption;
    sharedPreferences?.setString(AppKeys.theme, themeOption.name);
  }
}
