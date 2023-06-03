import '../../../core/resources/export_file.dart';

abstract interface class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}


class Params {
  final Unit data;
  Params(this.data);
  static Params empty=Params(unit);
}

