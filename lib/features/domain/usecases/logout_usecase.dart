
import 'package:project/features/domain/entity/data_value.dart';

import '../../../core/resources/export_file.dart';
import '../entity/logout.dart';
import 'base_usecase.dart';

final class LogoutUseCase implements BaseUseCase<NoParam, Logout> {
  final AppRepository _repository;

  LogoutUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Logout>> call(NoParam noParams) async {
    return await _repository.logout();
  }
}



