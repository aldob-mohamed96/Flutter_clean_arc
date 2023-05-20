import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enum/enums.dart';
import '../../../../core/resources/authentication_manager.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
    final AuthenticationManager _authenticationManager;
  AuthenticationCubit({required AuthenticationManager authenticationManager}):
    _authenticationManager=authenticationManager ,super(const AuthenticationState());


  Future<void> getAppAuthenticationLevel()async
  {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    final appAuthenticationLevel=_authenticationManager.getLevelAuthenticationApp();
    Future.delayed(Duration.zero);
    emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel: appAuthenticationLevel));
  }


  Future<void> updateAuthenticationLevel(AppAuthenticationLevel appAuthenticationLevel)async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    await _authenticationManager.setLevelAuthenticationApp(appAuthenticationLevel);
    Future.delayed(Duration.zero);
    emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:appAuthenticationLevel));

  }
  
  Future<void> logout()async
  {

    emit(state.copyWith(flowStateApp: FlowStateApp.loading,));
    await _authenticationManager.logout();
    Future.delayed(Duration.zero);
    emit(state.copyWith(flowStateApp: FlowStateApp.normal,appAuthenticationLevel:AppAuthenticationLevel.unAuthenticated));


  }

}
