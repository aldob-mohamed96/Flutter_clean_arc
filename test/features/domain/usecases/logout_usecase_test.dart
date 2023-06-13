import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';
import 'package:project/features/domain/entity/logout.dart';
import 'package:project/features/domain/usecases/logout_usecase.dart';
import 'logout_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppRepository>()])
void main() {
   
  late LogoutUseCase logoutUseCase;
  late MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
    logoutUseCase = LogoutUseCase(repository: mockRepository);
  });

  test('should return  logout(true) but operation failed remote api success ', () async {
    // Arrange
    const input = NoParam();
    const output=Logout(true);
    when(mockRepository.logout()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await logoutUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
 
    verify(mockRepository.logout());
    verifyNoMoreInteractions(mockRepository);
  });


    test('should return  logout(false) but operation failed remote api success but logout(false)', () async {
    // Arrange
    const input = NoParam();
    const output=Logout(false);
    when(mockRepository.logout()).thenAnswer((_) async => const Right(output));

    // Act
    final result = await logoutUseCase(input);

    // Assert
    expect(result, equals(const Right(output)));
    verify(mockRepository.logout());
    verifyNoMoreInteractions(mockRepository);
  });

 
     test('should return failure with an any error when get Token Data  contain  from local storage', () async {
    // Arrange
     const input = NoParam();
    
    when(mockRepository.logout()).thenAnswer((_) async =>const Left(Failure.empty()));
    // Act
    final result = await logoutUseCase(input);

    // Assert
    expect(result, equals(const Left(Failure.empty())));
 
    verify(mockRepository.logout());
    verifyNoMoreInteractions(mockRepository);
  });
  
}
