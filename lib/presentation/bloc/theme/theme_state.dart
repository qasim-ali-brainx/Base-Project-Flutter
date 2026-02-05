
import 'package:equatable/equatable.dart';
import '../../../core/theme/base_theme.dart';
import '../../../core/theme/dark_theme.dart';
import '../../../core/theme/light_theme.dart';

abstract class ThemeState extends Equatable {
  final BaseTheme theme;
  final bool isDarkMode;

  const ThemeState({required this.theme, required this.isDarkMode});

  @override
  List<Object> get props => [theme, isDarkMode];
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(theme: LightTheme(), isDarkMode: false);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(theme: DarkTheme(), isDarkMode: true);
}
