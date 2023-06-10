

import 'package:project/features/domain/entity/data_value.dart';

import '../../../core/resources/export_file.dart';
import 'base_usecase.dart';

final class GetAuthenticationUseCase implements BaseUseCase<NoParam, AppAuthenticationLevel> {
  final AppRepository _repository;

  GetAuthenticationUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, AppAuthenticationLevel>> call(NoParam noParams)  {
    return  _repository.getLevelAuthenticationApp();
  }
}

