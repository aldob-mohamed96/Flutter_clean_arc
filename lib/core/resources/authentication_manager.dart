// ignore_for_file: constant_identifier_names


import '../../../../core/resources/export_file.dart';
import '../../features/domain/usecases/app_usecase.dart';



abstract class AuthenticationManager
{
  AppAuthenticationLevel getLevelAuthenticationApp();

  Future<void> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel);
  Future<void> logout();

}
class AuthenticationManagerImpl extends AuthenticationManager {

  final LogoutUseCase _logoutUseCase;

  AuthenticationManagerImpl({required LogoutUseCase logoutUseCase}):_logoutUseCase=logoutUseCase;


  @override
  AppAuthenticationLevel getLevelAuthenticationApp()=>_appSettingPreferences.getAppAuthenticationLevel();

  @override
  Future<void> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel) async=> await _appSettingPreferences.setAppAuthenticationLevel(appAuthenticationLevel);
 
  @override
  Future<void> logout() async=> await _logoutUseCase.execute(unit);




}