
import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';

final class ChangeThemeAppUseCase implements BaseUseCase<ChangeThemeAppUseCaseInput, SuccessOperation> {
  final AppRepository _repository;

  ChangeThemeAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(ChangeThemeAppUseCaseInput input)  {
    return  _repository.setThemeAppPreferences(ThemeModeAppReuest(input.themeMode));
  }
}

final class ChangeThemeAppUseCaseInput{

 final ThemeMode themeMode;  
 ChangeThemeAppUseCaseInput(this.themeMode);

}