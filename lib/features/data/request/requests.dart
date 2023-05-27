import 'package:flutter/material.dart';

import '../../../core/enum/enums.dart';

final class AppAuthenticationLevelRequest{
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelRequest(this.appAuthenticationLevel);
}

final class ThemeModeAppReuest{

 final ThemeMode themeMode;  
 ThemeModeAppReuest(this.themeMode);

}

final class TokenRequest{

 final String value;  
 TokenRequest(this.value);

}