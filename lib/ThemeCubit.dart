import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit():super(ThemeInitialState());
  changeTheme(ThemeMode mode){
    emit(ChangeThemeState(mode));
  }
}
abstract class ThemeStates{}
class ThemeInitialState extends ThemeStates{}
class ChangeThemeState extends ThemeStates{
  ThemeMode mode;
  ChangeThemeState(this.mode);
}
