import '../../network/api/app_api.dart';
import '../../response/app_auth_response/app_auth_response.dart';

abstract interface class RemoteDataSource{
 
Future<LogoutAuthResponse> logout() ;

}
class RemoteDataSourceImpl extends RemoteDataSource{

  final AppServiceApiClient _appServiceApiClient;
  RemoteDataSourceImpl({required AppServiceApiClient appServiceApiClient }):_appServiceApiClient=appServiceApiClient;
  
  @override
  Future<LogoutAuthResponse> logout() async{
     return await _appServiceApiClient.logout("asd");
    
  }

}