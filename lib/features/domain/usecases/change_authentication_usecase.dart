

import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import 'base_usecase.dart';

class ChangeAuthenticationUseCase implements BaseUseCase<AppAuthenticationLevelUseCaseInput, Unit> {
  final AppRepository _repository;

  ChangeAuthenticationUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Unit>> execute(AppAuthenticationLevelUseCaseInput input)  {
    return  _repository.setLevelAuthenticationApp(AppAuthenticationLevelRequest(input.appAuthenticationLevel));
  }
}

class AppAuthenticationLevelUseCaseInput{
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelUseCaseInput(this.appAuthenticationLevel);
}