
import 'package:project/features/domain/entity/data_value.dart';

import '../../../core/resources/export_file.dart';

import 'base_usecase.dart';


final class GetTokenUseCase implements BaseUseCase<NoParam, TokenData> {
  final AppRepository _repository;

  GetTokenUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, TokenData>> call(NoParam noParam) async {
    return await _repository.getToken();
  }
}





