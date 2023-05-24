
import '../../../../core/resources/export_file.dart';


abstract class LocalDataSource{
 
Future<bool> logout() ;
Future<AppAuthenticationLevel> getLevelAuthenticationApp();
Future<bool> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel);

}
class LocalDataSourceImpl extends LocalDataSource{
  final AppPreferences _appPreferences;
  LocalDataSourceImpl({required AppPreferences appPreferences }):_appPreferences=appPreferences;
  
  @override
  Future<bool> logout() async=> await _appPreferences.logout();
    
  
  
  @override
  Future<AppAuthenticationLevel> getLevelAuthenticationApp() async=>_appPreferences.getAppAuthenticationLevel();
  
  @override
  Future<bool> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel) async=>_appPreferences.setAppAuthenticationLevel(appAuthenticationLevel);
  

}