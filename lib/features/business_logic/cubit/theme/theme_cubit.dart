import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../core/enum/enums.dart';
import '../../../../core/resources/app_constant.dart';
import '../../../../core/resources/theme_manager.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
    final ThemeManager _themeManager;
  ThemeCubit({required ThemeManager themeManager,}):
   _themeManager=themeManager,super(const ThemeState());


 void getAppTheme()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final themeMode=_themeManager.getThemeMode();
    Future.delayed(Duration.zero);
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,themeMode: themeMode));
  }
  
  Future<void> updateAppTheme(ThemeMode themeMode)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    await _themeManager.setThemeMode(themeMode);
    Future.delayed(Duration.zero);
    emit(state.copyWith(flowStateApp: FlowStateApp.normal,themeMode:themeMode));

  }
  
  Future<void> updateAppThemeFromBrightness()async
  {

    final themeMode = (SchedulerBinding.instance.window.platformBrightness ==Brightness.light)?ThemeMode.light:ThemeMode.dark;
    await updateAppTheme(themeMode);

  }
  

  ThemeData get getLightTheme=> _themeManager.getLightTheme;
  ThemeData get getDarkTheme=> _themeManager.getDarkTheme;
}
