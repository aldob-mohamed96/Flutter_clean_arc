part of 'localization_cubit.dart';



class LocalizationState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final Locale locale;

  const LocalizationState({
    this.failure=const Failure.empty(),
    this.flowStateApp=FlowStateApp.darft,
    this.locale=AppConstants.defaultLocal,

  });
  LocalizationState copyWith({
    Failure? failure,
    FlowStateApp? flowStateApp,
    Locale? locale,
  
  })=>LocalizationState(
      failure: failure??this.failure,
      flowStateApp:flowStateApp??this.flowStateApp,
      locale:locale??this.locale,
  );
  @override

  List<Object?> get props => [
     flowStateApp,
     failure,
     locale,

  ];


}


