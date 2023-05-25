

import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import 'base_usecase.dart';

class LogoutUseCase implements BaseUseCase<Unit, bool> {
  final AppRepository _repository;

  LogoutUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, bool>> execute(unit) async {
    return await _repository.logout();
  }
}


class GettingLevelAuthenticationAppUseCase implements BaseUseCase<Unit, AppAuthenticationLevel> {
  final AppRepository _repository;

  GettingLevelAuthenticationAppUseCase({required AppRepository repository}):_repository=repository;
  @override
  Future<Either<Failure, AppAuthenticationLevel>> execute(unit)  {
    return  _repository.getLevelAuthenticationApp();
  }
}

class ChangeLevelAuthenticationAppUseCase implements BaseUseCase<AppAuthenticationLevel, Unit> {
  final AppRepository _repository;

  ChangeLevelAuthenticationAppUseCase({required AppRepository repository}):_repository=repository;


  @override
  Future<Either<Failure, Unit>> execute(AppAuthenticationLevel appAuthenticationLevel)  {
    return  _repository.setLevelAuthenticationApp(appAuthenticationLevel);
  }
}

class GettingThemeAppUseCase implements BaseUseCase<Unit, ThemeMode> {
  final AppRepository _repository;

  GettingThemeAppUseCase({required AppRepository repository}):_repository=repository;


  @override
  Future<Either<Failure, ThemeMode>> execute(unit)  {
    return  _repository.getThemeAppPreferences();
  }
}

class ChangeThemeAppUseCase implements BaseUseCase<ThemeMode, Unit> {
  final AppRepository _repository;

  ChangeThemeAppUseCase({required AppRepository repository}):_repository=repository;


  @override
  Future<Either<Failure, Unit>> execute(ThemeMode themeMode)  {
    return  _repository.setThemeAppPreferences(themeMode);
  }
}