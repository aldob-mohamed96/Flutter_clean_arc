

import 'package:flutter/material.dart';
import 'package:project/features/domain/entity/data_value.dart';

import '../resources/export_file.dart';
import '../service/localization/app_localizations.dart';



//primitive value
extension NonNullString on String? {

                                                          
  String orEmptyString({String defaultValue = AppConstants.defaultEmptyString}) => (this == null) ? defaultValue : this??defaultValue;

  TokenData getTokenValue({String defaultValue = AppConstants.defaultEmptyString}) => (this == null) ? TokenData(defaultValue) : TokenData(this??defaultValue);
 
 
  LocalAppData getLocalAppValue({String defaultValue = AppConstants.defaultLanguageAppCode}) => (this == null) ? LocalAppData(Locale(defaultValue)) : LocalAppData(Locale(this??defaultValue)); 
  
  ThemeModeData getThemeModeApp({ThemeMode defaultValue=AppConstants.defaultTheme}) {
    if(this==null)
    {
      return ThemeModeData(defaultValue);
    }
    else if(this==AppConstants.lightTheme)
    {
      return const ThemeModeData(ThemeMode.light);
    }
    else if(this==AppConstants.darkTheme)
    {
      return const ThemeModeData(ThemeMode.dark);
    }
    else if(this==AppConstants.systemTheme)
    {
      return const ThemeModeData(ThemeMode.system);
    }
    else
     {
       return ThemeModeData(defaultValue);
     }

  }
  AppAuthenticationLevelData getAppAuthenticationLevel({AppAuthenticationLevel defaultValue=AppAuthenticationLevel.darft }) {
    if(this==null)
      {
        return AppAuthenticationLevelData(defaultValue);
      }
    else if(this==AppAuthenticationLevel.unAuthenticated.name)
     {
       return const AppAuthenticationLevelData(AppAuthenticationLevel.unAuthenticated);
     }
    else if(this==AppAuthenticationLevel.authenticated.name)
     {
       return const AppAuthenticationLevelData(AppAuthenticationLevel.authenticated);
     }
    else
     {
       return const AppAuthenticationLevelData(AppAuthenticationLevel.darft);
     }
  }
  double convertToDouble({double defaultValue = AppConstants.defaultEmptyDouble}) => (this == null) ? defaultValue : double.tryParse(this!)??defaultValue;
  int    convertToInteger({int defaultValue = AppConstants.defaultEmptyInteger}) => (this == null) ? defaultValue : int.tryParse(this!)??defaultValue;

}
extension NonNullInteger on int? {
  int orZeroInteger({int defaultValue = AppConstants.defaultEmptyInteger})=> (this == null) ? defaultValue : this??defaultValue;

}
extension NonNullStringData on String {

    String tr(BuildContext context)=>AppLocalizationsImpl.of(context)!.translate(this); 
}



extension NonNullMap on Map? {
  Map orEmptyMap({Map defaultValue=AppConstants.defaultEmptyMap })=> (this == null) ?defaultValue : this??defaultValue;

}
extension NonNullList<T> on List? {
  List orEmptyList({List defaultValue=AppConstants.defaultEmptyGenericList })=> (this == null) ?defaultValue : this??defaultValue;

}
extension NonNullDobule on double? {
  double orZeroDouble({double defaultValue=AppConstants.defaultEmptyDouble })=> (this == null) ?defaultValue : this??defaultValue;

  double doubleTwoDigit({double defaultValue=AppConstants.defaultEmptyDoubleWithTwoDigit})=> (this == null) ? defaultValue : double.parse(this!.toStringAsFixed(AppValue.appValue2));

}
extension NonNullBool on bool? {

  bool orBoolDefaultFalseValue({bool defaultValue=AppConstants.defaultEmptyBoolFalse})=> (this == null) ? defaultValue : this??defaultValue;

  bool orBoolDefaultTrueValue({bool defaultValue=AppConstants.defaultEmptyBoolTrue})=> (this == null) ? defaultValue : this??defaultValue;
  
 
}
extension NonNullBoolData on Future<bool> {
  Future<SuccessOperation> booLDataReturnedValue()async=> SuccessOperation(await this);
}

extension BuildContextValue on BuildContext {

  // media query from view edges
  double get height  => MediaQuery.sizeOf(this).height;
  double get width   => MediaQuery.sizeOf(this).width;
  
  // view insets from view edges
  double get topViewInsets    => MediaQuery.viewInsetsOf(this).top;
  double get bottomViewInsets => MediaQuery.viewInsetsOf(this).bottom;
  double get leftViewInsets   => MediaQuery.viewInsetsOf(this).left;
  double get rightViewInsets  => MediaQuery.viewInsetsOf(this).right;
  double get toViewInsetsHorizontal => leftViewInsets + rightViewInsets;
  double get toViewInsetsVertical   => topViewInsets + bottomViewInsets;


  // padding from view edges
  double get toPaddingBottom  => MediaQuery.viewPaddingOf(this).bottom;
  double get toPaddingLeft    => MediaQuery.viewPaddingOf(this).left;
  double get toPaddingRight   => MediaQuery.viewPaddingOf(this).right;
  double get toPaddingTop     => MediaQuery.viewPaddingOf(this).top;
  double get toPaddingHorizontal => toPaddingLeft + toPaddingRight;
  double get toPaddingVertical   => toPaddingTop + toPaddingBottom;
 

  // device pixel ratio and text scale factor
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);

  // orientation
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  Orientation get orientation => MediaQuery.orientationOf(this);



  // route and navigation
  bool get isCurrentDialogShowing => ModalRoute.of(this)?.isCurrent != true;
  void pushReplacedNamedExtension(String routes)=>WidgetsBinding.instance.addPostFrameCallback((_)async
   {
       dismissDialog();
       await Future.delayed(Duration.zero);
       GoRouter.of(this).go(routes);
    });
  void pushNamedExtension(String routes)=>WidgetsBinding.instance.addPostFrameCallback((_) async{
      dismissDialog();
      
      Future.delayed(Duration.zero);
       GoRouter.of(this).go(routes);
    });
  void dismissDialog() =>(isCurrentDialogShowing) ?Navigator.of(this, rootNavigator: true).pop(true):null;
  void popUpExtension()async=>WidgetsBinding.instance.addPostFrameCallback((_)async {
      
      dismissDialog();
      await Future.delayed(Duration.zero);
      GoRouter.of(this).pop(true);
      
    });

  //theme mode
  ThemeMode get themeMode => read<ThemeCubit>().state.themeMode;
  ThemeData get darkTheme => read<ThemeCubit>().getDarkTheme;
  ThemeData get lightTheme => read<ThemeCubit>().getLightTheme;

  ThemeCubit get themeCubit => BlocProvider.of<ThemeCubit>(this);
 


}


extension AppAuthenticationLevelEx on AppAuthenticationLevel{
  String getRoutesStatus()=>switch(this)
  {
    AppAuthenticationLevel.authenticated=> Routes.homeRoute,
    AppAuthenticationLevel.unAuthenticated=> Routes.loginRoute,
    AppAuthenticationLevel.darft=> Routes.onBoardingRoute,
    

   };
}
extension SizedBoxValuesHeightOrWidth on num{

  SizedBox get heightSizedBox => SizedBox(height:toDouble());

  SizedBox get widthSizedBox => SizedBox(width:toDouble());

  String  toDoubleNumber(int digit)=>toStringAsFixed(digit);

  int get toIntgerNumber=>toInt(); 

}





extension OrientationExtension on Orientation{
  Orientation get toLandScape=>Orientation.landscape;
  Orientation get toPortrait=>Orientation.portrait;
}

extension InputFiledError on DataSourceValidationInput?
{
  String getErrorInput() {
    switch (this) {
      case  DataSourceValidationInput.empty:
        return AppStrings.emptyInput;
      case  DataSourceValidationInput.usernameStyle:
        return AppStrings.usernameStyleInput;
      case  DataSourceValidationInput.shortPassword:
        return AppStrings.shortPasswordInput;
      case  DataSourceValidationInput.notIdenticalPassword:
        return AppStrings.notIdenticalPasswordInput;
      case  DataSourceValidationInput.weakPassword:
        return AppStrings.weakPasswordInput;
      case  DataSourceValidationInput.veryLong:
        return AppStrings.veryLongInput;
      case  DataSourceValidationInput.length:
        return AppStrings.lengthInput;
      case  DataSourceValidationInput.maxInputCount:
        return AppStrings.maxInputCountInput;
      case  DataSourceValidationInput.notPhoneStyle:
        return AppStrings.notPhoneStyleInput;
      case  DataSourceValidationInput.notEmail:
        return AppStrings.notEmailInput;
      case  DataSourceValidationInput.notInteger:
        return AppStrings.notIntegerInput;
      case  DataSourceValidationInput.notDouble:
        return AppStrings.notDoubleInput;
      case  DataSourceValidationInput.notBool:
        return AppStrings.notBoolInput;
      case  DataSourceValidationInput.notString:
        return AppStrings.notStringInput;
      case  DataSourceValidationInput.containSpecialChar:
        return AppStrings.containSpecialCharInput;
      case  DataSourceValidationInput.unknown:
        return AppStrings.unknownInput;
      case  DataSourceValidationInput.inValidFormat:
        return AppStrings.invalidInput;
      default :
        return AppStrings.validInput;
    }
  }
}
extension DataSourceExtension on DataSourceNetworkError {
  Failure getFailure() {
    switch (this) {
      case DataSourceNetworkError.success:
        return const Failure(ResponseCode.success, ResponseMessage.success);
      case DataSourceNetworkError.notFound:
        return const Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSourceNetworkError.noContent:
        return const Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSourceNetworkError.badContent:
        return const Failure(ResponseCode.badContent, ResponseMessage.badContent);
      case DataSourceNetworkError.forbidden:
        return const Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSourceNetworkError.unAuthorised:
        return const Failure(ResponseCode.unAuthorised, ResponseMessage.unAuthorised);
      case DataSourceNetworkError.internalServerError:
        return const Failure(ResponseCode.internalServerError,ResponseMessage.internalServerError);
      case DataSourceNetworkError.connectTimeOut:
        return const Failure( ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSourceNetworkError.cancel:
        return const Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSourceNetworkError.recieveTimeOut:
        return const Failure(ResponseCode.recieveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSourceNetworkError.sendTimeOut:
        return const Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSourceNetworkError.cashError:
        return const Failure(ResponseCode.cashError, ResponseMessage.cashError);
      case DataSourceNetworkError.noInternetConnection:
        return const Failure(ResponseCode.noInternetConnection,ResponseMessage.noInternetConnection);
      default:
        return AppConstants.unknownfailure;
    }
  }
}

extension CashedItemExtension on CashedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    return currentTimeInMillis - cashTime < expirationTimeInMillis;
  }
}

extension DataSourceLocationExtension on DataSourceLocationError {
  Failure getFailure() {
    switch (this) {
      case DataSourceLocationError.success:
        return const Failure(ResponseCode.success, ResponseMessage.success);
      case DataSourceLocationError.locationUnAvailable:
        return const Failure(ResponseCode.locationUnAvailable,ResponseMessage.locationUnAvailable);
      case DataSourceLocationError.locationPermissionDined:
        return const Failure(ResponseCode.locationPermissionDined,ResponseMessage.locationPermissionDined);
      case DataSourceLocationError.locationServiceDisabled:
        return const Failure(ResponseCode.locationServiceDisabled,ResponseMessage.locationServiceDisabled);
      case DataSourceLocationError.locationDetectedTimeOut:
        return const Failure(ResponseCode.locationDetectedTimeOut,ResponseMessage.locationDetectedTimeOut);
      case DataSourceLocationError.locationUpdateError:
        return const Failure(ResponseCode.locationUpdateError,ResponseMessage.locationUpdateError);
      case DataSourceLocationError.locationAlreadySubscribed:
        return const Failure(ResponseCode.locationAlreadySubscribed,ResponseMessage.locationAlreadySubscribed);
      case DataSourceLocationError.locationActivityMissing:
        return const Failure(ResponseCode.locationActivityMissing,ResponseMessage.locationActivityMissing);
      default:
          return AppConstants.unknownfailure;
    }
  }
}

extension DataSourcePermissionErrorExtension on DataSourcePermission {
  Failure getFailure() {
    switch (this) {
      case DataSourcePermission.checkPermissionError:
        return const Failure(ResponseCode.permissionCheckError,ResponseMessage.permissionCheckError);
      case DataSourcePermission.permissionDenied:
        return const Failure(ResponseCode.permissionDined, ResponseMessage.permissionDined);
      case DataSourcePermission.permissionPermanentlyDenied:
        return const Failure(ResponseCode.permissionPermanentlyDenied,ResponseMessage.permissionPermanentlyDenied);
      case DataSourcePermission.permissionRestricted:
        return const Failure(ResponseCode.permissionRestricted,ResponseMessage.permissionRestricted);
      case DataSourcePermission.noImageSelected:
        return const Failure(ResponseCode.noImageSelected, ResponseMessage.noImageSelected);
      case DataSourcePermission.unknownPermissionError:
        return const Failure(ResponseCode.unknownPermissionError,ResponseMessage.unknownPermissionError);
      default:
         return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceLaunchUrlExtension on DataSourceLaunchUrl {
  Failure getFailure() {
    switch (this) {
      case DataSourceLaunchUrl.cantNotOpen:
        return const Failure(ResponseCode.cantNotOpen, ResponseMessage.cantNotOpen);
      case DataSourceLaunchUrl.systemError:
        return const Failure(ResponseCode.systemError, ResponseMessage.systemError);
      case DataSourceLaunchUrl.inValidUrl:
        return const Failure(ResponseCode.inValidUrl, ResponseMessage.inValidUrl);
      default:
         return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceBatteryStateExtension on DataSourceBatteryState {
  Failure getFailure() {
    switch (this) {
      case DataSourceBatteryState.errorInfo:
        return const Failure(ResponseCode.batteryInfoError, ResponseMessage.batteryInfoError);
      default:
         return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceLocalNotificationExtension on DataSourceLocalNotification {
  Failure getFailure() {
    switch (this) {
      case DataSourceLocalNotification.onShowError:
        return const Failure(ResponseCode.onShowError, ResponseMessage.onShowError);
      case DataSourceLocalNotification.onCancelAllError:
        return const Failure(
            ResponseCode.onCancelAllError, ResponseMessage.onCancelAllError);
      case DataSourceLocalNotification.onCancelOneError:
        return const Failure(
            ResponseCode.onCancelOneError, ResponseMessage.onCancelOneError);
      case DataSourceLocalNotification.onInitError:
        return const Failure(ResponseCode.onInitError, ResponseMessage.onInitError);
      case DataSourceLocalNotification.onDidReceiveNotificationError:
        return const Failure(ResponseCode.onDidReceiveNotificationError,
            ResponseMessage.onDidReceiveNotificationError);
      case DataSourceLocalNotification.onGetDetailsNotificationError:
        return const Failure(ResponseCode.onGetDetailsNotificationError,
            ResponseMessage.onGetDetailsNotificationError);
      case DataSourceLocalNotification.onGetSettingIosOrAndroidError:
        return const Failure(ResponseCode.onGetSettingIosOrAndroidError,ResponseMessage.onGetSettingIosOrAndroidError);
      default:
       return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceTimerStateExtension on DataSourceTimer {
  Failure getFailure() {
    switch (this) {
      case DataSourceTimer.isActive:
        return const Failure( ResponseCode.timerIsActive, ResponseMessage.timerIsActive);
      case DataSourceTimer.isInactive:
        return const Failure(ResponseCode.timerIsInActive, ResponseMessage.timerIsInActive);
      case DataSourceTimer.timerCancelError:
        return const Failure( ResponseCode.timerCancelError, ResponseMessage.timerCancelError);
      case DataSourceTimer.errorTimer:
        return const Failure(ResponseCode.timerError, ResponseMessage.timerError);
      default:
        return AppConstants.unknownfailure;
    }
  }
}








