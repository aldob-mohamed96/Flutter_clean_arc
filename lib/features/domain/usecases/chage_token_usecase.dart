
import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';


class ChangeTokenUseCase implements BaseUseCase<ChangeTokenUseCaseInput, SuccessOperation> {
  final AppRepository _repository;

  ChangeTokenUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(ChangeTokenUseCaseInput changeTokenUseCaseInput) async {
    return await _repository.setToken(TokenRequest(changeTokenUseCaseInput.token));
  }
}

  class ChangeTokenUseCaseInput{
  String token;
  ChangeTokenUseCaseInput(this.token);

}



