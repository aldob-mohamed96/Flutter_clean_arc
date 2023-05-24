part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final ThemeMode themeMode;

  const ThemeState({
    this.failure=const Failure.empty(),
    this.flowStateApp=FlowStateApp.darft,
    this.themeMode=AppConstants.defaultTheme,

  });
  ThemeState copyWith({
    Failure? failure,
    FlowStateApp? flowStateApp,
    ThemeMode? themeMode,
  
  })=>ThemeState(
      failure: failure??this.failure,
      flowStateApp:flowStateApp??this.flowStateApp,
      themeMode:themeMode??this.themeMode,
  );
  @override

  List<Object?> get props => [
     flowStateApp,
     failure,
     themeMode,

  ];


}


