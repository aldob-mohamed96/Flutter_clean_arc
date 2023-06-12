import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';

final class NoData extends Equatable{
    const NoData._internal();
    
      @override
      List<Object?> get props => [];
}

final class NoParam extends Equatable{
    const NoParam();
    
      @override
      List<Object?> get props => [];
}

final class SuccessOperation extends Equatable{
    final bool value;
    const SuccessOperation(this.value);
    
      @override
      List<Object?> get props => [value];
}

final class TokenData extends Equatable{
    final String value;
    const TokenData(this.value);
    
      @override
      List<Object?> get props => [value];
}

final class AppAuthenticationLevelData extends Equatable{
    final AppAuthenticationLevel value;
    const AppAuthenticationLevelData(this.value);
    
      @override
      List<Object?> get props => [value];
}
final class LocalAppData extends Equatable{
    final Locale value;
    const LocalAppData(this.value);
    
      @override
      List<Object?> get props => [value];
}

final class ThemeModeData extends Equatable{
    final ThemeMode value;
    const ThemeModeData(this.value);
    
      @override
      List<Object?> get props => [value];
}


