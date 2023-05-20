part of 'authentication_cubit.dart';


class AuthenticationState extends Equatable {
  final FlowStateApp flowStateApp;
  final AppAuthenticationLevel appAuthenticationLevel;


  const AuthenticationState({
    this.flowStateApp=FlowStateApp.darft,
    this.appAuthenticationLevel=AppAuthenticationLevel.darft,


  });
  AuthenticationState copyWith({
    FlowStateApp? flowStateApp,
    AppAuthenticationLevel? appAuthenticationLevel,
    
 
  })=>AuthenticationState(
      flowStateApp:flowStateApp??this.flowStateApp,
      appAuthenticationLevel:appAuthenticationLevel??this.appAuthenticationLevel,
    
  );
  @override

  List<Object?> get props => [
     flowStateApp,
     appAuthenticationLevel,
     

  ];
}