
import '../../../core/resources/export_file.dart';

import 'base_usecase.dart';


class GetTokenUseCase implements BaseUseCase<Params, String> {
  final AppRepository _repository;

  GetTokenUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, String>> execute(Params params) async {
    return await _repository.getToken();
  }
}





