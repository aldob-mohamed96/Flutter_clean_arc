
import '../../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/logout.dart';
import '../entity/data_value.dart';
abstract interface class AppRepository {


  Future<Either<Failure,Logout>> logout();
  Future<Either<Failure,AppAuthenticationLevelData>> getLevelAuthenticationApp();
  Future<Either<Failure,SuccessOperation>> cashLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
 
  Future<Either<Failure,ThemeModeData>> getThemeApp();
  Future<Either<Failure,SuccessOperation>> cashThemeApp(ThemeModeAppReuest themeModeAppReuest);
  Future<Either<Failure,TokenData>> getToken();
  Future<Either<Failure,SuccessOperation>> cashToken(TokenRequest tokenRequest);
  Future<Either<Failure,SuccessOperation>> cashLocalApp(LocalAppRequest localAppRequest);
  Future<Either<Failure,LocalAppData>> getLocalApp();
  
 

}



