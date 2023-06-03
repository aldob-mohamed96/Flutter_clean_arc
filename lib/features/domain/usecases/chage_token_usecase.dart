
import '../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import 'base_usecase.dart';

final class ChangeTokenUseCase implements BaseUseCase<ChangeTokenUseCaseInput, Unit> {
  final AppRepository _repository;

  ChangeTokenUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Unit>> execute(ChangeTokenUseCaseInput changeTokenUseCaseInput) async {
    return await _repository.setToken(TokenRequest(changeTokenUseCaseInput.token));
  }
}

final class ChangeTokenUseCaseInput{
  String token;
  ChangeTokenUseCaseInput(this.token);

}



