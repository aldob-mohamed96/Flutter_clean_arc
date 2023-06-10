import 'package:flutter/material.dart';

import '../../../core/enum/enums.dart';

  class AppAuthenticationLevelRequest{
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelRequest(this.appAuthenticationLevel);
}

  class ThemeModeAppReuest{

 final ThemeMode themeMode;  
 ThemeModeAppReuest(this.themeMode);

}

  class TokenRequest{

 final String value;  
 TokenRequest(this.value);

}