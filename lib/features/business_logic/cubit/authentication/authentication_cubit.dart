import '../../../../core/resources/export_file.dart';


part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  
  final LogoutUseCase _logoutUseCase;
  final GettingLevelAuthenticationAppUseCase _gettingLevelAuthenticationAppUseCase;
  final ChangeLevelAuthenticationAppUseCase _changeLevelAuthenticationAppUseCase;

  AuthenticationCubit({
    required LogoutUseCase logoutUseCase,
    required GettingLevelAuthenticationAppUseCase gettingLevelAuthenticationAppUseCase,
    required ChangeLevelAuthenticationAppUseCase changeLevelAuthenticationAppUseCase,
    }):
    _logoutUseCase=logoutUseCase ,
    _gettingLevelAuthenticationAppUseCase=gettingLevelAuthenticationAppUseCase ,
    _changeLevelAuthenticationAppUseCase=changeLevelAuthenticationAppUseCase ,
    
    super(const AuthenticationState());


  void getAppAuthenticationLevel()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _gettingLevelAuthenticationAppUseCase.execute(unit);
    Future.delayed(Duration.zero);
     result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (appAuthenticationLevel)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:appAuthenticationLevel)));

   
   }


  void updateAuthenticationLevel(AppAuthenticationLevel appAuthenticationLevel)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _changeLevelAuthenticationAppUseCase.execute(appAuthenticationLevel);
    Future.delayed(Duration.zero);
    result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (unit)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:appAuthenticationLevel)));
  }
  
  void logout()async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _logoutUseCase.execute(unit);
    Future.delayed(Duration.zero);
    result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (isLoggedOut)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:AppAuthenticationLevel.unAuthenticated)));


  }

}
