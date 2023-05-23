import 'package:project/core/resources/export_file.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}