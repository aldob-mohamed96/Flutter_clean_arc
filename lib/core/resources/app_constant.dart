


import 'package:flutter/material.dart';

import 'export_file.dart';


 sealed class AppConstants {

  //code verification
  static const int verificationCodeLength = 4;

  //loading widget parameter
  static const double strokeWidth = 4.0;
  static const Color backgroundCircularLoading = ColorManager.backgroundColorCircularLoading;

  //urls
   static  const String baseUrlsDebug =SecertData.baseUrlsDebug ;
   static const String baseUrls = SecertData.baseUrls;
   static const String googleApiKey = SecertData.googleApiKey; 
   static const String apiKeyPassword = SecertData.apiKeyPassword ;


  //key of Preferences
  static const String appLocalePrefsKey = SecertData.appLocalePrefsKey;
  static const String appAppAuthenticationLevelPrefsKey = SecertData.appAppAuthenticationLevelPrefsKey;
  static const String appThemeModePrefsKey = SecertData.appThemeModePrefsKey;
  static const String appTokenUserPrefsKey = SecertData.appTokenUserPrefsKey;
  static const String appUserIsLoggedInPrefsKey = SecertData.appUserIsLoggedInPrefsKey;
  static const int appCashedAuthenticationResponseTimeInterval = SecertData.appCashedAuthenticationResponseTimeInterval;


  //failure
   static const  Failure unknownfailure=Failure(  ResponseCode.unknownError, ResponseMessage.unknownError, );

  // default value of primitive
  static const String defaultEmptyString = "";
  static const int defaultEmptyInteger = 0;
  static const double defaultEmptyDouble = 0.0;
  static const double defaultEmptyDoubleWithTwoDigit = 0.0;
  static const bool defaultEmptyBoolFalse = false;
  static const bool defaultEmptyBoolTrue = true;
  static const List<String> defaultEmptyListString = [];
  static const List defaultEmptyGenericList = [];
  static const Map defaultEmptyMap = {};

  //onBoarding screen
  static const int timeDelayOnBoardingScreen = 4;
  static const Duration timerDurationTick = Duration(seconds: 1);
  static const int timerDuration = 300;

//default core Setting theme ...
  static const String defaultThemeModeApp = 'light';
  static const String lightTheme = "light";
  static const String darkTheme = "dark";
  static const String systemTheme = "system";
  static const ThemeMode defaultTheme = ThemeMode.light;
  static const ThemeMode theme = ThemeMode.light;

  //default core Setting language
  static const String defaultLanguageAppCode = "ar";
  static const String arabicLanguageCode = "ar";
  static const String englishLanguageCode = "en";
  static const Locale englishLocal = Locale("en", '');
  static const Locale defaultLocal = Locale("ar", '');
  static const Locale arabicLocal = Locale("ar", '');
  static const Iterable<Locale> supportedLocales =
  [
    englishLocal,
    arabicLocal
  ];



//default core Setting version
  static const String appVersion = "1.0.0";
  static const String iosVersion = "1.0.0";
  static const bool forceUpdateVersion = true;
  static const String enableVersion = "1";
  static const String appName = AppStrings.appName;



//scheme url launcher
  static const String androidAppUrlLauncher = "market://details?id=";
  static const String iosAppUrlLauncher = "https://apps.apple.com/us/app/";
  static const String telSchemeUrlLauncher = "tel://";
  static const String mailSchemeUrlLauncher = "mailto:";
  static const String linkSchemeUrlLauncher = "https";

// link google map
  static const String googleMapUrl1 = 'https://www.google.com/maps/search/?api=1&query=';
  static const String appleMapUrl = 'https://maps.apple.com/?sll=';

// image size camera and gallery picker
  static const double maxWidthImgPickerCamera = 1800.0;
  static const double maxWidthImgPickerGallery = 1800.0;
  static const int qualityImgPickerGallery = 60; //quality in Percentage 0....100 %
  static const double maxHeightImgPickerCamera = 1800.0;
  static const double maxHeightImgPickerGallery = 1800.0;
  static const int qualityImgPickerCamera = 60;


// local Notification
  static const String appLocalNotificationAndroidIcon = "@drawable/imgNotificationAndroid";
  static const String appLocalNotificationAndroidSoundName = "sound";
  static const String appLocalNotificationIosSoundName = "sound.aiff";
  static const String appLocalNotificationAndroidTicker = "ticker";
  static const String appLocalNotificationAndroidChannelId = "high_importance_channel";
  static const String appLocalNotificationAndroidChannelName = "channel_name";
  static const String appLocalNotificationAndroidChannelDescription = "description";
  static const bool appLocalNotificationIosRequestAlertPermission = true;
  static const bool appLocalNotificationIosRequestBadgePermission = true;
  static const bool appLocalNotificationIosRequestSoundPermission = true;
  static const bool appLocalNotificationIosRequestVibrationPermission = true;

//location Setting
         //android Setting location
  static const Position defaultPosition = Position(latitude: 24.467945225887952, longitude: 39.61108389737581, timestamp:null, accuracy: 0.0, altitude: 0.0, heading: 0.0, speed: 0.0, speedAccuracy: 0.0);
  static const String notificationTextForegroundAndroidLocation = AppStrings.notificationTextForegroundAndroidLocation;
  static const String notificationTitleForegroundAndroidLocation = AppStrings.notificationTitleForegroundAndroidLocation;
  static const bool enableWakeLockForegroundAndroidLocation = false;
  static const bool enableWifiLockForegroundAndroidLocation = false;
  static const String notificationIconForegroundAndroidLocation = "@drawable/imgLocationAndroidNotification";
  static const bool enableForceLocationManagerAndroid = true;
  static const Duration intervalDurationLocationAndroid =  Duration(seconds: 1);
  static const Duration timeLimitLocationAndroid = Duration(seconds: 1);
  static const int distanceFilterLocationAndroid = 100;
  static const LocationAccuracy locationAccuracyAndroid = LocationAccuracy.best;
          //apple Setting Location
  static const Duration timeLimitLocationIos =  Duration(seconds: 1);
  static const int distanceFilterLocationIos = 100;
  static const LocationAccuracy locationAccuracyIos = LocationAccuracy.best;
  static const ActivityType activityTypeLocationIos = ActivityType.other;
  static const bool pauseLocationUpdatesAutomaticallyIos = false;
  static const bool showBackgroundLocationIndicatorIos = false;
  //other PlatForm
  static const Duration timeLimitLocationOtherPlatForm =  Duration(seconds: 1);
  static const LocationAccuracy locationAccuracyOtherPlatForm = LocationAccuracy.best;
  static const int distanceFilterLocationOtherPlatForm = 100;


  //network constant 
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String lang = "lang";
  static const String deviceToken = "device_token";
  static const String authorization = "authorization";
  static const String authenticationToken = "auth-token";
  static const String defaultLanguageApi  = "language";
  static const int receiveTimeout = 60000;
  static const int sendTimeout = 60000;

  //asset path json images sound
  
   static const String assetImagesPath  = "assets/images/";
   static const String assetJsonPath  = "assets/json/";
   static const String assetSoundPath  = "assets/sound/";
   static const String assetTranslationPath  = "assets/translations";

  

   //network data



   //urls api 
   static const String logoutUrl  = "/logout";


}


