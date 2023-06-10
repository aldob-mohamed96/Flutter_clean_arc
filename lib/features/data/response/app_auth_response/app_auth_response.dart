import '../../../../core/resources/export_file.dart';
import '../base/base_response.dart';
part 'app_auth_response.g.dart';
@JsonSerializable()
class LogoutAuthResponse extends BaseResponse{
  @JsonKey(name: "isLoggedOut")
  bool? isLoggedOut;

  LogoutAuthResponse(this.isLoggedOut);
  factory LogoutAuthResponse.fromJson(Map<String,dynamic> json)=>_$LogoutAuthResponseFromJson(json);
  //to json
  Map<String,dynamic> toJson()=>_$LogoutAuthResponseToJson(this);


}