import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialState());
  bool lightTheme = false;
  theme(BuildContext context) {
    lightTheme ? emit(LightThemeState()) : emit(DarkThemeState());
    if (lightTheme) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    lightTheme = !lightTheme;
  }
}
