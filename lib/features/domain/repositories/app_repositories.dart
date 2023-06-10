
import '../../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/logout.dart';
import '../entity/data_value.dart';
abstract interface class AppRepository {


  Future<Either<Failure,Logout>> logout();
  Future<Either<Failure,AppAuthenticationLevel>> getLevelAuthenticationApp();
  Future<Either<Failure,SuccessOperation>> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
 
  Future<Either<Failure,ThemeModeData>> getThemeAppPreferences();
  Future<Either<Failure,SuccessOperation>> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest);
  Future<Either<Failure,TokenData>> getToken();
  Future<Either<Failure,SuccessOperation>> setToken(TokenRequest tokenRequest);
  
 

}



