

import '../../../core/resources/export_file.dart';

final class Failure extends Equatable implements Exception {
  final int code;
  final String message;
  const Failure(this.code,this.message);
  const Failure.empty():this(AppConstants.defaultEmptyInteger,AppConstants.defaultEmptyString);
  const Failure.unknown():this(ResponseCode.unknownError,ResponseMessage.unknownError);
  const Failure.network():this(ResponseCode.noInternetConnection,ResponseMessage.noInternetConnection);
  const Failure.cash():this(ResponseCode.cashError,ResponseMessage.cashError);

  @override
  String toString() {
    return 'Failure{code: $code, message: $message}';
  }

  
 

  @override

  List<Object?> get props => [code,message];

}
