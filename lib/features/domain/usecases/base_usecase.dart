import 'package:project/core/resources/export_file.dart';

abstract class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}