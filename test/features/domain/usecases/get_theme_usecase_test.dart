import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/get_theme_usecase.dart';
import 'chage_token_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late GetThemeAppUseCase getThemeAppUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    getThemeAppUseCase = GetThemeAppUseCase(repository: mockRepository);
  });

  test('should return  ThemeModeData contain value (light ,dark or system) successfully from local storage', () async {
    // Arrange
    const input = NoParam();
    const output=ThemeModeData(ThemeMode.light);
    when(mockRepository.getThemeApp()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await getThemeAppUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
 
    verify(mockRepository.getThemeApp());
    verifyNoMoreInteractions(mockRepository);
  });

 
     test('should return failure cashed  when get ThemeModeData contain  from local storage', () async {
    // Arrange
     const input = NoParam();
    
    when(mockRepository.getThemeApp()).thenAnswer((_) async =>const Left(Failure.cash()));
    // Act
    final result = await getThemeAppUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.getThemeApp());
    verifyNoMoreInteractions(mockRepository);
  });
  
}
