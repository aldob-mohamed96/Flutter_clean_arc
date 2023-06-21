import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:project/core/resources/export_file.dart';
import  'package:mockito/mockito.dart';
import 'package:project/features/domain/entity/data_value.dart';
import '../../repositories_impl/app_repositories_impl_test.dart';

@GenerateNiceMocks([MockSpec<LocalDataSource>()])
void main() {
 
 late MockLocalDataSourceImpl mockLocalDataSourceImpl;

 setUp(() {
  mockLocalDataSourceImpl=MockLocalDataSourceImpl();
 });


  group('authentication', () { 

           
        const tAppAuthenticationLevelData=AppAuthenticationLevelData(AppAuthenticationLevel.authenticated);    
        test('should return AppAuthenticationLevelData from getAuthentivation successfully', () async{
          //arrange
          when(mockLocalDataSourceImpl.getLevelAuthenticationApp()).thenAnswer((_) async => tAppAuthenticationLevelData);
           
          //act
          final result = await mockLocalDataSourceImpl.getLevelAuthenticationApp();
          //assert
          expect(result, tAppAuthenticationLevelData);
          verify(mockLocalDataSourceImpl.getLevelAuthenticationApp());
          verifyNoMoreInteractions(mockLocalDataSourceImpl);


           
        });


         test('should return AppAuthenticationLevelData from getAuthentivation successfully', () async{
          //arrange
          when(mockLocalDataSourceImpl.getLevelAuthenticationApp()).thenAnswer((_) async => tAppAuthenticationLevelData);
           
          //act
          final result = await mockLocalDataSourceImpl.getLevelAuthenticationApp();
          //assert
          expect(result, tAppAuthenticationLevelData);
          verify(mockLocalDataSourceImpl.getLevelAuthenticationApp());
          verifyNoMoreInteractions(mockLocalDataSourceImpl);

          
           
        });

  });
}