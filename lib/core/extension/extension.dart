

import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';



//primitive value
extension NonNullString on String? {
  String orEmptyString({String defaultValue = AppConstants.defaultEmptyString}) => (this == null) ? defaultValue : this??defaultValue;

  ThemeMode getThemeModeApp({ThemeMode defaultValue=AppConstants.defaultTheme}) {
    if(this==null)
    {
      return defaultValue;
    }
    else if(this==AppConstants.lightTheme)
    {
      return ThemeMode.light;
    }
    else if(this==AppConstants.darkTheme)
    {
      return ThemeMode.dark;
    }
    else if(this==AppConstants.systemTheme)
    {
      return ThemeMode.system;
    }
    else
     {
       return defaultValue;
     }

  }
  AppAuthenticationLevel getAppAuthenticationLevel({AppAuthenticationLevel defaultValue=AppAuthenticationLevel.darft }) {
    if(this==null)
      {
        return defaultValue;
      }
    else if(this==AppAuthenticationLevel.darft.name)
     {
       return AppAuthenticationLevel.darft;
     }
    else if(this==AppAuthenticationLevel.unAuthenticated.name)
     {
       return AppAuthenticationLevel.unAuthenticated;
     }
    else if(this==AppAuthenticationLevel.authenticated.name)
     {
       return AppAuthenticationLevel.authenticated;
     }
    else
     {
       return AppAuthenticationLevel.darft;
     }
  }
  double convertToDouble({double defaultValue = AppConstants.defaultEmptyDouble}) => (this == null) ? defaultValue : double.tryParse(this!)??defaultValue;
  int    convertToInteger({int defaultValue = AppConstants.defaultEmptyInteger}) => (this == null) ? defaultValue : int.tryParse(this!)??defaultValue;

}
extension NonNullInteger on int? {
  int orZeroInteger({int defaultValue = AppConstants.defaultEmptyInteger})=> (this == null) ? defaultValue : this??defaultValue;

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

extension BuildContextValue on BuildContext {
  double get height  => MediaQuery.of(this).size.height;
  double get width   => MediaQuery.of(this).size.width;
  double get bottom  => MediaQuery.of(this).viewInsets.bottom;
  
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;
  double get toPaddingBottom  => MediaQuery.of(this).viewPadding.bottom;
  double get toPaddingTop     => MediaQuery.of(this).viewPadding.top;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  Orientation get orientation => MediaQuery.of(this).orientation;



  void pushReplacedNamedExtension(String routes)=>WidgetsBinding.instance.addPostFrameCallback((_)async
   {
       dismissDialog();
       await Future.delayed(Duration.zero);
       pushReplacementNamed(routes);
    });
  void pushNamedExtension(String routes)=>WidgetsBinding.instance.addPostFrameCallback((_) async{
      dismissDialog();
      
      Future.delayed(Duration.zero);
      pushNamed(routes);
    });

  bool get isCurrentDialogShowing => ModalRoute.of(this)?.isCurrent != true;
 
  void dismissDialog() =>(isCurrentDialogShowing) ?Navigator.of(this, rootNavigator: true).pop(true):null;
    
  
  void popUpExtension()async=>WidgetsBinding.instance.addPostFrameCallback((_)async {
      
      dismissDialog();
      await Future.delayed(Duration.zero);
      Navigator.of(this,rootNavigator: true).pop(true);
      
    });

ThemeMode get getAppTheme=>read<ThemeCubit>().state.themeMode;    
ThemeData get getLightTheme=>read<ThemeCubit>().getLightTheme;    
ThemeData get getDarkTheme=>read<ThemeCubit>().getDarkTheme;   



}


extension SizedBoxValuesHeightOrWidth on num{

  SizedBox get heightSizedBox => SizedBox(height:toDouble());

  SizedBox get widthSizedBox => SizedBox(width:toDouble());

  String  toDoubleNumber(int digit)=>toStringAsFixed(digit);

  int get toIntgerNumber=>toInt(); 

}


extension HandleAuthentication on AuthenticationState{

   void changeAuthenticationStateExtension(BuildContext context)
   {
    switch (appAuthenticationLevel) {
            case AppAuthenticationLevel.authenticated:
                       context.pushReplacedNamedExtension(Routes.homeRoute);
                  break;
            case AppAuthenticationLevel.unAuthenticated:
                       context.pushReplacedNamedExtension(Routes.loginRoute);
                  break;
            case AppAuthenticationLevel.darft:
                       context.pushReplacedNamedExtension(Routes.onBoardingRoute);
                  break;
            default:
                       context.pushReplacedNamedExtension(Routes.splashRoute,);
                  break;
          }
   }

}


extension OrientationExtension on Orientation{
  Orientation get toLandScape=>Orientation.landscape;
  Orientation get toPortrait=>Orientation.portrait;
}









