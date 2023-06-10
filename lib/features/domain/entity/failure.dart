

import '../../../core/resources/export_file.dart';

class Failure extends Equatable {
  final int code;
  final String message;
  const Failure(this.code,this.message);
  const Failure.empty():this(AppConstants.defaultEmptyInteger,AppConstants.defaultEmptyString);
  const Failure.unknown():this(ResponseCode.unknownError,ResponseMessage.unknownError);
  const Failure.network():this(ResponseCode.noInternetConnection,ResponseMessage.noInternetConnection);
  @override

  List<Object?> get props => [code,message];

}
