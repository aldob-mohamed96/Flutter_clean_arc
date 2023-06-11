import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/get_authentication_usecase.dart';
import 'chage_token_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late GetAuthenticationUseCase getAuthenticationUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    getAuthenticationUseCase = GetAuthenticationUseCase(repository: mockRepository);
  });

  test('should return  AppAuthenticationLevel (authenticated ,unauthenticated or darft) successfully from local storage', () async {
    // Arrange
    const input = NoParam();
    const output=AppAuthenticationLevel.authenticated;
    when(mockRepository.getLevelAuthenticationApp()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await getAuthenticationUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
 
    verify(mockRepository.getLevelAuthenticationApp());
    verifyNoMoreInteractions(mockRepository);
  });

 
     test('should return Failure when get AppAuthenticationLevel (authenticated,unauthenticated or darft) occurred Exception from local storage ', () async {
    // Arrange
     const input = NoParam();
    
    when(mockRepository.getLevelAuthenticationApp()).thenAnswer((_) async =>const Left(Failure.cash()));
    // Act
    final result = await getAuthenticationUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.getLevelAuthenticationApp());
    verifyNoMoreInteractions(mockRepository);
  });
  
}
