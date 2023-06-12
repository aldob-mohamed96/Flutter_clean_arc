
import 'package:flutter/material.dart';

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';

final class ChangeLocaleAppUseCase implements BaseUseCase<ChangeLocaleAppUseCaseInput, SuccessOperation> {
  final AppRepository _repository;

  ChangeLocaleAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(ChangeLocaleAppUseCaseInput input)  {
    return  _repository.cashLocalApp(LocalAppRequest(input.locale));
  }
}

final class ChangeLocaleAppUseCaseInput{

 final Locale locale;  
 ChangeLocaleAppUseCaseInput(this.locale);

}