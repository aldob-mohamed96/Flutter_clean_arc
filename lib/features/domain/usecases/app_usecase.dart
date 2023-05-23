

import '../../../core/resources/export_file.dart';
import 'base_usecase.dart';

class LogoutUseCase implements BaseUseCase<Unit, bool> {
  final AppRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(unit) async {
    return await _repository.logout();
  }
}