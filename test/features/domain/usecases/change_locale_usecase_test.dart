import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/data/request/requests.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/change_locale_usecase.dart';

import 'logout_usecase_test.mocks.dart';

 

void main() {
   
  late ChangeLocaleAppUseCase changeLocaleAppUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    changeLocaleAppUseCase = ChangeLocaleAppUseCase(repository: mockRepository);
  });

  test('should return SuccessOperation(true) when locale changed to (english ,arabic) successfully', () async {
    // Arrange
    final input = ChangeLocaleAppUseCaseInput(AppConstants.arabicLocal);
    when(mockRepository.cashLocalApp(any)).thenAnswer((_) async => const Right(SuccessOperation(true)));

    // Act
    final result = await changeLocaleAppUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(true))));
 
    verify(mockRepository.cashLocalApp(argThat(isA<LocalAppRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });





    test(' should return SuccessOperation(false) when locale changed to ( english , arabic ) un successfully ', () async {
    // Arrange
    final input = ChangeLocaleAppUseCaseInput(AppConstants.arabicLocal);
    when(mockRepository.cashLocalApp(any)).thenAnswer((_) async => const Right(SuccessOperation(false)));

    // Act
    final result = await changeLocaleAppUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(false))));
 
    verify(mockRepository.cashLocalApp(argThat(isA<LocalAppRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });


     test('should return Failure when Locale changing operation occurred cashed Exception', () async {
    // Arrange
     final input = ChangeLocaleAppUseCaseInput(AppConstants.arabicLocal);
    when(mockRepository.cashLocalApp(any)).thenAnswer((_) async => const Left(Failure.cash()));

    // Act
    final result = await changeLocaleAppUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.cashLocalApp(argThat(isA<LocalAppRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });
  
}
