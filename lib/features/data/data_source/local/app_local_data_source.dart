
import '../../../../core/resources/export_file.dart';


abstract class LocalDataSource{
 
Future<bool> logout() ;

}
class LocalDataSourceImpl extends LocalDataSource{
  final AppPreferences _appPreferences;
  LocalDataSourceImpl({required AppPreferences appPreferences }):_appPreferences=appPreferences;
  
  @override
  Future<bool> logout() async{
     return await _appPreferences.logout();
    
  }

}