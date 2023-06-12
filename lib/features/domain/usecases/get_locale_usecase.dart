
import '../../../core/resources/export_file.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';

final class GetLocaleAppUseCase implements BaseUseCase<NoParam, LocalAppData> {
  final AppRepository _repository;

  GetLocaleAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, LocalAppData>> call(NoParam noParams) async {
    return  await _repository.getLocalApp();
  }
}

