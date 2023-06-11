

enum AppAuthenticationLevel{
  darft,
  unAuthenticated,
  authenticated
}
enum FlowStateApp{
  darft,
  loading,
  normal,
  error,
  successInserting,
  successDeleting,
  successUpdate,
  hint,
  missingData,
  unAuthenticated,
  updateApp,
  noConnection,
  weakConnection,
  connectionRestored

}
enum DataSourceValidationInput {
  empty,
  usernameStyle,
  shortPassword,
  notIdenticalPassword,
  weakPassword,
  veryLong,
  length,
  maxInputCount,
  notPhoneStyle,
  notEmail,
  notInteger,
  notDouble,
  notBool,
  notString,
  containSpecialChar,
  unknown,
  inValidImg,
  inValidFormat,
  valid
}
enum DataSourcePermission {
  allow,
  checkPermissionError,
  permissionDenied,
  permissionPermanentlyDenied,
  permissionRestricted,
  unknownPermissionError,
  noImageSelected,
  imageSelected
}

enum DataSourceNetworkError {
  success,
  noContent,
  badContent,
  forbidden,
  unAuthorised,
  notFound,
  internalServerError,
  socketError,
  formatException,
  
  connectTimeOut,
  cancel,
  recieveTimeOut,
  sendTimeOut,
  cashError,
  noInternetConnection,
  unknownError,
  
}
enum DataSourceLocationError {
  success,
  locationPermissionDined,
  locationServiceDisabled,
  locationDetectedTimeOut,
  locationUnAvailable,
  locationUpdateError,
  locationAlreadySubscribed,
  locationActivityMissing,

  unknownError,
}

enum DataSourceLaunchUrl {
  success,
  cantNotOpen,
  inValidUrl,
  systemError,
  unKnownLauncherError,
}
enum LangaugeCode {
  ar,
  en,
}
enum DataSourceBatteryState {
  charging,
  discharging,
  errorInfo,
  fullCharging,
  unknownError
}
enum DataSourceTimer {
  isActive,
  isInactive,
  errorTimer,
  timerCancelError,
  unknownError
}
enum DataSourceLocalNotification {
  show,
  onInitError,
  onGetSettingIosOrAndroidError,
  onCancelAllError,
  onCancelOneError,
  onShowError,
  onSelectNotificationError,
  onDidReceiveNotificationError,
  onGetDetailsNotificationError
}