import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';

class NoData extends Equatable{
    const NoData._internal();
    
      @override
      List<Object?> get props => [];
}

class NoParam extends Equatable{
    const NoParam();
    
      @override
      List<Object?> get props => [];
}

class SuccessOperation extends Equatable{
    final bool value;
    const SuccessOperation(this.value);
    
      @override
      List<Object?> get props => [value];
}

class TokenData extends Equatable{
    final String value;
    const TokenData(this.value);
    
      @override
      List<Object?> get props => [value];
}
class ThemeModeData extends Equatable{
    final ThemeMode value;
    const ThemeModeData(this.value);
    
      @override
      List<Object?> get props => [value];
}


