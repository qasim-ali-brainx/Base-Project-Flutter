import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/managers/preferences/preference_manager.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final PreferenceManager preferenceManager;
  static const String _keyIsDarkMode = 'isDarkMode';

  ThemeBloc({required this.preferenceManager}) : super(LightThemeState()) {
    on<ThemeStarted>(_onStarted);
    on<ToggleThemeEvent>(_onToggle);
  }

  Future<void> _onStarted(ThemeStarted event, Emitter<ThemeState> emit) async {
    final saved = await preferenceManager.getBool(key: _keyIsDarkMode);
    if (saved == true) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  Future<void> _onToggle(ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    final nextIsDark = !state.isDarkMode;
    await preferenceManager.setBool(key: _keyIsDarkMode, value: nextIsDark);
    if (nextIsDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}
