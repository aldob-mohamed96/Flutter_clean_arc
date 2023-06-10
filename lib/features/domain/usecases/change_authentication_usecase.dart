

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';

final class ChangeAuthenticationUseCase implements BaseUseCase<AppAuthenticationLevelUseCaseInput, SuccessOperation> {
  final AppRepository _repository;

  ChangeAuthenticationUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(AppAuthenticationLevelUseCaseInput input)  {
    return  _repository.setLevelAuthenticationApp(AppAuthenticationLevelRequest(input.appAuthenticationLevel));
  }
}

final class AppAuthenticationLevelUseCaseInput{
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelUseCaseInput(this.appAuthenticationLevel);
}