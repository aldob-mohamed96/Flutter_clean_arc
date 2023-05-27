

import '../../../core/resources/export_file.dart';
import 'base_usecase.dart';

final class GetAuthenticationUseCase implements BaseUseCase<Params, AppAuthenticationLevel> {
  final AppRepository _repository;

  GetAuthenticationUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, AppAuthenticationLevel>> execute(Params params)  {
    return  _repository.getLevelAuthenticationApp();
  }
}

