import '../../../domain/entity/data_value.dart';
import '../../../domain/usecases/chage_token_usecase.dart';
import '../../../domain/usecases/get_token_usecase.dart';

import '../../../../core/resources/export_file.dart';
import '../../../domain/usecases/change_authentication_usecase.dart';
import '../../../domain/usecases/get_authentication_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';


part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  
  final LogoutUseCase _logoutUseCase;
  final GetAuthenticationUseCase _getAuthenticationUseCase;
  final ChangeAuthenticationUseCase _changeAuthenticationUseCase;


  AuthenticationCubit({
    required LogoutUseCase logoutUseCase,
    required GetAuthenticationUseCase getAuthenticationUseCase,
    required ChangeAuthenticationUseCase changeAuthenticationUseCase,
    required GetTokenUseCase getTokenUseCase,
    required ChangeTokenUseCase changeTokenUseCase,
    }):
    _logoutUseCase=logoutUseCase ,
    _getAuthenticationUseCase=getAuthenticationUseCase ,
    _changeAuthenticationUseCase=changeAuthenticationUseCase ,

    
    super(const AuthenticationState());


  void getAppAuthenticationLevel()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _getAuthenticationUseCase(const NoParam());
    
    Future.delayed(Duration.zero);
    
     result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (appAuthenticationLevel)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:appAuthenticationLevel)));

   
   }


  void updateAuthenticationLevel(AppAuthenticationLevel appAuthenticationLevel)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _changeAuthenticationUseCase(AppAuthenticationLevelUseCaseInput(appAuthenticationLevel));
    Future.delayed(Duration.zero);
    result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (unit)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:appAuthenticationLevel)));
  }
  
  void logout()async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final result=await _logoutUseCase(const NoParam());
    Future.delayed(Duration.zero);
    result.fold(
      (failure)=> emit(state.copyWith(flowStateApp: FlowStateApp.error,failure:failure)),
      (isLoggedOut)=>emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:AppAuthenticationLevel.unAuthenticated)));


  }

}
