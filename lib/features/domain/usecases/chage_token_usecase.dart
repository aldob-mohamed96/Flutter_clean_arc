
import 'package:project/features/data/request/requests.dart';

import '../../../core/resources/export_file.dart';

import 'base_usecase.dart';

class ChangeTokenUseCase implements BaseUseCase<ChangeTokenUseCaseInput, Unit> {
  final AppRepository _repository;

  ChangeTokenUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, Unit>> execute(ChangeTokenUseCaseInput changeTokenUseCaseInput) async {
    return await _repository.setToken(TokenRequest(changeTokenUseCaseInput.token));
  }
}

class ChangeTokenUseCaseInput{
  String token;
  ChangeTokenUseCaseInput(this.token);

}



