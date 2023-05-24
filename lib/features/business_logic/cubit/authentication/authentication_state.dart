part of 'authentication_cubit.dart';


class AuthenticationState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final AppAuthenticationLevel appAuthenticationLevel;


  const AuthenticationState({
    this.flowStateApp=FlowStateApp.darft,
    this.failure=const Failure.empty(),
    this.appAuthenticationLevel=AppAuthenticationLevel.darft,


  });
  AuthenticationState copyWith({
    Failure? failure,
    FlowStateApp? flowStateApp,
    AppAuthenticationLevel? appAuthenticationLevel,
    
 
  })=>AuthenticationState(
      failure:failure??this.failure,
      flowStateApp:flowStateApp??this.flowStateApp,
      appAuthenticationLevel:appAuthenticationLevel??this.appAuthenticationLevel,
    
  );
  @override

  List<Object?> get props => [
     flowStateApp,
     failure,
     appAuthenticationLevel,
     

  ];
}