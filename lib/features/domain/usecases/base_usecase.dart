import '../../../core/resources/export_file.dart';

abstract interface class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}


