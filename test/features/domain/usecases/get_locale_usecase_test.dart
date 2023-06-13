import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/get_locale_usecase.dart';

import 'logout_usecase_test.mocks.dart';


void main() {
   
  late GetLocaleAppUseCase getLocaleAppUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    getLocaleAppUseCase = GetLocaleAppUseCase(repository: mockRepository);
  });

  test('should return  Locale Data contain value (arabic,english) successfully from local storage', () async {
    // Arrange
    const input = NoParam();
    const output=LocalAppData(AppConstants.arabicLocal);
    when(mockRepository.getLocalApp()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await getLocaleAppUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
 
    verify(mockRepository.getLocalApp());
    verifyNoMoreInteractions(mockRepository);
  });

 
     test('should return failure cashed  when get Locale Data contain  from local storage', () async {
    // Arrange
     const input = NoParam();
    
    when(mockRepository.getLocalApp()).thenAnswer((_) async =>const Left(Failure.cash()));
    // Act
    final result = await getLocaleAppUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.getLocalApp());
    verifyNoMoreInteractions(mockRepository);
  });
  
}
