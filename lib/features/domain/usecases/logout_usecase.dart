
import '../../../core/resources/export_file.dart';
import '../entity/logout.dart';
import 'base_usecase.dart';

class LogoutUseCase implements BaseUseCase<Params, Logout> {
  final AppRepository _repository;

  LogoutUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Logout>> execute(Params noParams) async {
    return await _repository.logout();
  }
}



