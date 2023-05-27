
import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import 'base_usecase.dart';

final class ChangeThemeAppUseCase implements BaseUseCase<ChangeThemeAppUseCaseInput, Unit> {
  final AppRepository _repository;

  ChangeThemeAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Unit>> execute(ChangeThemeAppUseCaseInput input)  {
    return  _repository.setThemeAppPreferences(ThemeModeAppReuest(input.themeMode));
  }
}

final class ChangeThemeAppUseCaseInput{

 final ThemeMode themeMode;  
 ChangeThemeAppUseCaseInput(this.themeMode);

}