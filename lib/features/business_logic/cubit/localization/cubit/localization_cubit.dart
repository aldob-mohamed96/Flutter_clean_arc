import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/features/domain/usecases/get_locale_usecase.dart';

import '../../../../../core/enum/enums.dart';
import '../../../../../core/resources/app_constant.dart';
import '../../../../domain/entity/data_value.dart';
import '../../../../domain/entity/failure.dart';
import '../../../../domain/usecases/change_locale_usecase.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  final ChangeLocaleAppUseCase _changeLocaleAppUseCase;
  final GetLocaleAppUseCase _getLocaleAppUseCase;

  LocalizationCubit({required GetLocaleAppUseCase getLocaleAppUseCase,required ChangeLocaleAppUseCase changeLocaleAppUseCase}) :_changeLocaleAppUseCase=changeLocaleAppUseCase, _getLocaleAppUseCase=getLocaleAppUseCase ,super(const LocalizationState());



  void updateAppLocale(Locale locale)async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _changeLocaleAppUseCase(ChangeLocaleAppUseCaseInput(locale));
    Future.delayed(Duration.zero);
    result.fold(
      (failure) => emit(state.copyWith(flowStateApp: FlowStateApp.error,failure: failure)),
      (isChanged)=>  emit(state.copyWith(flowStateApp: FlowStateApp.normal,locale: locale))
      );

  }

  void getLocaleApp()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _getLocaleAppUseCase(const NoParam());
    Future.delayed(Duration.zero);
    result.fold(
      (failure) => emit(state.copyWith(flowStateApp: FlowStateApp.error,failure: failure)),
      (locale)=>  emit(state.copyWith(flowStateApp: FlowStateApp.normal,locale: locale.value))
      );

  }
}


