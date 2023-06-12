
import '../../../core/resources/export_file.dart';
import '../entity/data_value.dart';
import 'base_usecase.dart';

final class GetThemeAppUseCase implements BaseUseCase<NoParam, ThemeModeData> {
  final AppRepository _repository;

  GetThemeAppUseCase({required AppRepository repository}):_repository=repository;

  @override
  Future<Either<Failure, ThemeModeData>> call(NoParam noParams) async {
    return  await _repository.getThemeApp();
  }
}

