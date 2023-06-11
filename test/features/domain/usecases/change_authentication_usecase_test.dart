import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/data/request/requests.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/change_authentication_usecase.dart';
import 'chage_token_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late ChangeAuthenticationUseCase changeAuthenticationUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    changeAuthenticationUseCase = ChangeAuthenticationUseCase(repository: mockRepository);
  });

  test('should return SuccessOperation(true) when AppAuthenticationLevel changed to (authenticated ,unauthenticated or darft) successfully', () async {
    // Arrange
    final input = AppAuthenticationLevelUseCaseInput(AppAuthenticationLevel.authenticated);
    when(mockRepository.setLevelAuthenticationApp(any)).thenAnswer((_) async => const Right(SuccessOperation(true)));

    // Act
    final result = await changeAuthenticationUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(true))));
 
    verify(mockRepository.setLevelAuthenticationApp(argThat(isA<AppAuthenticationLevelRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });





    test('should return SuccessOperation(false) when AppAuthenticationLevel not changed successfully', () async {
    // Arrange
     final input = AppAuthenticationLevelUseCaseInput(AppAuthenticationLevel.authenticated);
    when(mockRepository.setLevelAuthenticationApp(any)).thenAnswer((_) async => const Right(SuccessOperation(false)));

    // Act
    final result = await changeAuthenticationUseCase(input);

    // Assert
    expect(result, equals(const Right(SuccessOperation(false))));
 
    verify(mockRepository.setLevelAuthenticationApp(argThat(isA<AppAuthenticationLevelRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });


     test('should return Failure when AppAuthenticationLevel changing operation occurred cashed Exception', () async {
    // Arrange
    final input = AppAuthenticationLevelUseCaseInput(AppAuthenticationLevel.authenticated);
    when(mockRepository.setLevelAuthenticationApp(any)).thenAnswer((_) async => const Left(Failure.cash()));

    // Act
    final result = await changeAuthenticationUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.setLevelAuthenticationApp(argThat(isA<AppAuthenticationLevelRequest>())));
    verifyNoMoreInteractions(mockRepository);
  });
  
}
