// ignore: depend_on_referenced_packages
import '../../../../core/resources/export_file.dart';

part 'base_response.g.dart';
@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message; 
  @JsonKey(name: "code")
  int? code; 
 }

