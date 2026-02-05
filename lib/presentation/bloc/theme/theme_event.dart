import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeStarted extends ThemeEvent {
  const ThemeStarted();
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}
