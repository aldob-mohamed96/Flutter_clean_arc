
import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import 'base_usecase.dart';

class GetThemeAppUseCase implements BaseUseCase<Params, ThemeMode> {
  final AppRepository _repository;

  GetThemeAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, ThemeMode>> execute(Params noParams)  {
    return  _repository.getThemeAppPreferences();
  }
}

