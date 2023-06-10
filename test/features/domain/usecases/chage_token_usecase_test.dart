
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/data/request/requests.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/chage_token_usecase.dart';

import 'chage_token_usecase_test.mocks.dart';





@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late ChangeTokenUseCase changeTokenUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    changeTokenUseCase = ChangeTokenUseCase(repository: mockRepository);
  });

  test('should return SuccessOperation(true) when token is changed successfully', () async {
    // Arrange
    final input = ChangeTokenUseCaseInput('any String test input');
    when(mockRepository.setToken(any)).thenAnswer((_) async => const Right(SuccessOperation(true)));

    // Act
    final result = await changeTokenUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(true))));
 
    verify(mockRepository.setToken(argThat(isA<TokenRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });


    test('should return SuccessOperation(false) when token is not changed', () async {
    // Arrange
    final input = ChangeTokenUseCaseInput('any String test input');
    when(mockRepository.setToken(any)).thenAnswer((_) async => const Right(SuccessOperation(false)));

    // Act
    final result = await changeTokenUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(false))));
 
    verify(mockRepository.setToken(argThat(isA<TokenRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });


     test('should return Failure when token changing operation occurred cashed Exception', () async {
    // Arrange
    final input = ChangeTokenUseCaseInput('any String test input');
    when(mockRepository.setToken(any)).thenAnswer((_) async => const Left(Failure.unknown()));

    // Act
    final result = await changeTokenUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.unknown())));
 
    verify(mockRepository.setToken(argThat(isA<TokenRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });
  
}
