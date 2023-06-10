
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../core/resources/export_file.dart';
import '../../../domain/entity/data_value.dart';
import '../../../domain/usecases/base_usecase.dart';

import '../../../domain/usecases/change_theme_usecase.dart';
import '../../../domain/usecases/get_theme_usecase.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeManager _themeManager;
  final GetThemeAppUseCase _getThemeAppUseCase;
  final ChangeThemeAppUseCase _changeThemeAppUseCase;
  ThemeCubit({
    required ThemeManager themeManager,
    required GetThemeAppUseCase getThemeAppUseCase,
    required ChangeThemeAppUseCase changeThemeAppUseCase,}):
   _themeManager=themeManager,
   _changeThemeAppUseCase=changeThemeAppUseCase,
   _getThemeAppUseCase=getThemeAppUseCase
   ,super(const ThemeState());


 void getAppTheme()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _getThemeAppUseCase(const NoParam());
    Future.delayed(Duration.zero);
    result.fold(
      (failure)   => emit(state.copyWith(flowStateApp: FlowStateApp.error,failure: failure)),
      (themeMode) {
        _themeManager.changeStatusBarAndNavigationBarColors(themeMode.value);  
        emit(state.copyWith(flowStateApp: FlowStateApp.normal,themeMode: themeMode.value));
      },
    );
   
  }
  
  void updateAppTheme(ThemeMode themeMode)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _changeThemeAppUseCase(ChangeThemeAppUseCaseInput(themeMode));
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

    final themeMode = (SchedulerBinding.instance.platformDispatcher.platformBrightness ==Brightness.light)?ThemeMode.light:ThemeMode.dark;
    updateAppTheme(themeMode);

  }
  

  ThemeData get getLightTheme=> _themeManager.getLightTheme;
  ThemeData get getDarkTheme=> _themeManager.getDarkTheme;
}
