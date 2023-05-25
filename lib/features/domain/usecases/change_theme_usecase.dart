
import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import 'base_usecase.dart';

class ChangeThemeAppUseCase implements BaseUseCase<ChangeThemeAppUseCaseInput, Unit> {
  final AppRepository _repository;

  ChangeThemeAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Unit>> execute(ChangeThemeAppUseCaseInput input)  {
    return  _repository.setThemeAppPreferences(ThemeModeAppReuest(input.themeMode));
  }
}

class ChangeThemeAppUseCaseInput{

 final ThemeMode themeMode;  
 ChangeThemeAppUseCaseInput(this.themeMode);

}