import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/usecases/get_token_usecase.dart';
import 'logout_usecase_test.mocks.dart';

void main() {
   
  late GetTokenUseCase getTokenUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    getTokenUseCase = GetTokenUseCase(repository: mockRepository);
  });

  test('should return  TokenData contain value token successfully from local storage', () async {
    // Arrange
    const input = NoParam();
    const output=TokenData("token value");
    when(mockRepository.getToken()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await getTokenUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
 
    verify(mockRepository.getToken());
    verifyNoMoreInteractions(mockRepository);
  });

 
     test('should return failure cashed  when get Token Data  contain  from local storage', () async {
    // Arrange
     const input = NoParam();
    
    when(mockRepository.getToken()).thenAnswer((_) async =>const Left(Failure.cash()));
    // Act
    final result = await getTokenUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.cash())));
 
    verify(mockRepository.getToken());
    verifyNoMoreInteractions(mockRepository);
  });
  
}
