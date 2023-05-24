
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project/core/resources/export_file.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeManager _themeManager;
  final GettingThemeAppUseCase _gettingThemeAppUseCase;
  final ChangeThemeAppUseCase _changeThemeAppUseCase;
  ThemeCubit({
    required ThemeManager themeManager,
    required GettingThemeAppUseCase gettingThemeAppUseCase,
    required ChangeThemeAppUseCase changeThemeAppUseCase,}):
   _themeManager=themeManager,
   _changeThemeAppUseCase=changeThemeAppUseCase,
   _gettingThemeAppUseCase=gettingThemeAppUseCase
   ,super(const ThemeState());


 void getAppTheme()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _gettingThemeAppUseCase.execute(unit);
    Future.delayed(Duration.zero);
    result.fold(
      (failure)   => emit(state.copyWith(flowStateApp: FlowStateApp.error,failure: failure)),
      (themeMode) {
        _themeManager.changeStatusBarAndNavigationBarColors(themeMode);  
        emit(state.copyWith(flowStateApp: FlowStateApp.normal,themeMode: themeMode));
      },
    );
   
  }
  
  void updateAppTheme(ThemeMode themeMode)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _changeThemeAppUseCase.execute(themeMode);
    Future.delayed(Duration.zero);
    result.fold(
      (failure) => emit(state.copyWith(flowStateApp: FlowStateApp.error,failure: failure)),
      (unit)
      {
         _themeManager.changeStatusBarAndNavigationBarColors(themeMode); 
         emit(state.copyWith(flowStateApp: FlowStateApp.normal,themeMode: themeMode));
      }
      
      );

  }
  
  void updateAppThemeFromBrightness()async
  {

    final themeMode = (SchedulerBinding.instance.window.platformBrightness ==Brightness.light)?ThemeMode.light:ThemeMode.dark;
    updateAppTheme(themeMode);

  }
  

  ThemeData get getLightTheme=> _themeManager.getLightTheme;
  ThemeData get getDarkTheme=> _themeManager.getDarkTheme;
}
