part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final FlowStateApp flowStateApp;
  final ThemeMode themeMode;

  const ThemeState({
    this.flowStateApp=FlowStateApp.darft,
    this.themeMode=AppConstants.defaultTheme,

  });
  ThemeState copyWith({
    FlowStateApp? flowStateApp,
    ThemeMode? themeMode,
  
  })=>ThemeState(
      flowStateApp:flowStateApp??this.flowStateApp,
      themeMode:themeMode??this.themeMode,
  );
  @override

  List<Object?> get props => [
     flowStateApp,
     themeMode,

  ];


}


