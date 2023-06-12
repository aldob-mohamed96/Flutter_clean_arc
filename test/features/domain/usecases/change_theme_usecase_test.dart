import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/data/request/requests.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/change_theme_usecase.dart';
import 'chage_token_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late ChangeThemeAppUseCase changeThemeAppUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    changeThemeAppUseCase = ChangeThemeAppUseCase(repository: mockRepository);
  });

  test('should return SuccessOperation(true) when Theme mode  changed to (light ,dark or systems) successfully', () async {
    // Arrange
    final input = ChangeThemeAppUseCaseInput(ThemeMode.light);
    when(mockRepository.cashThemeApp(any)).thenAnswer((_) async => const Right(SuccessOperation(true)));

    // Act
    final result = await changeThemeAppUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(true))));
 
    verify(mockRepository.cashThemeApp(argThat(isA<ThemeModeAppReuest>())));
    verifyNoMoreInteractions(mockRepository);
  });





    test('should return SuccessOperation(true) when Theme mode not changed to (light ,dark or systems) successfully', () async {
    // Arrange
 final input = ChangeThemeAppUseCaseInput(ThemeMode.light);
    when(mockRepository.cashThemeApp(any)).thenAnswer((_) async => const Right(SuccessOperation(false)));

    // Act
    final result = await changeThemeAppUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(false))));
 
    verify(mockRepository.cashThemeApp(argThat(isA<ThemeModeAppReuest>())));
    verifyNoMoreInteractions(mockRepository);
  });


     test('should return Failure when Theme mode changing operation occurred cashed Exception', () async {
    // Arrange
     final input = ChangeThemeAppUseCaseInput(ThemeMode.light);
    when(mockRepository.cashThemeApp(any)).thenAnswer((_) async => const Left(Failure.cash()));

    // Act
    final result = await changeThemeAppUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.cashThemeApp(argThat(isA<ThemeModeAppReuest>())));
    verifyNoMoreInteractions(mockRepository);
  });
  
}
