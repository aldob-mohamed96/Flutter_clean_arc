import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/domain/entity/data_value.dart';







class  MockNetworkInfoImpl extends Mock implements NetworkInfoImpl {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: Future<bool>.value(true),
        returnValueForMissingStub: Future<bool>.value(true),
      ) as Future<bool>;
}
class  MockRemoteDataSourceImpl extends Mock implements RemoteDataSourceImpl {
  @override
  Future<LogoutAuthResponse> logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: Future<LogoutAuthResponse>.value(
            LogoutAuthResponse(true)..status=ApiInternalStatusCode.success..code=ResponseCode.success..message=ResponseMessage.success),
        returnValueForMissingStub: Future<LogoutAuthResponse>.value(
            LogoutAuthResponse(true)..status=ApiInternalStatusCode.success..code=ResponseCode.success..message=ResponseMessage.success),
      ) as Future<LogoutAuthResponse>;
}
class  MockLocalDataSourceImpl extends Mock implements LocalDataSourceImpl {
  @override
  Future<SuccessOperation> logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: Future<SuccessOperation>.value(
           const SuccessOperation(true)),
        returnValueForMissingStub: Future<SuccessOperation>.value(
          const  SuccessOperation(true)),
      ) as Future<SuccessOperation>;
}
void main() {
 
late MockRemoteDataSourceImpl mockRemoteDataSource;
late MockLocalDataSourceImpl mockLocalDataSource;
late MockNetworkInfoImpl mockNetworkInfo;
late AppRepositoryImpl appRepositoryImpl;

setUp(() {

mockRemoteDataSource = MockRemoteDataSourceImpl();
mockLocalDataSource = MockLocalDataSourceImpl();
mockNetworkInfo = MockNetworkInfoImpl();
appRepositoryImpl = AppRepositoryImpl(remoteDataSource: mockRemoteDataSource,localDataSource: mockLocalDataSource,networkInfo: mockNetworkInfo,);
});

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

      
          group('logout', () {
          
                
              runTestsOnline(()
              {

              test('should return Logout object  when internet is connected and  logout remote and local data source is successfull', () async {
        
                        
                          
                        const outputLocalDataSource=SuccessOperation(true);
                        final outputReomteDataSource=LogoutAuthResponse(true)
                             ..status=ApiInternalStatusCode.success
                             ..code=ResponseCode.success 
                             ..message=ResponseMessage.success;
                    

                        // arrange
                     
                        when(mockLocalDataSource.logout()).thenAnswer((_) async => outputLocalDataSource);
                        when(mockRemoteDataSource.logout()).thenAnswer((_) async => outputReomteDataSource);
                        
                        // act
                        final result = await appRepositoryImpl.logout();
                       
                        // assert
                        expect(result, equals(Right(outputReomteDataSource.toDomain())));
                        
                        
                        verify(mockLocalDataSource.logout());
                        verify(mockRemoteDataSource.logout());
                       

                        
                        verifyNoMoreInteractions(mockLocalDataSource);
                        verifyNoMoreInteractions(mockRemoteDataSource);
                        
                });

              test('should return unknown Failure  when internet is connected and  logout local data source is fail', () async {
        
                        
                          
                        const outputLocalDataSource= Failure.unknown();
                        final outputReomteDataSource=LogoutAuthResponse(true)
                             ..status=ApiInternalStatusCode.success
                             ..code=ResponseCode.success 
                             ..message=ResponseMessage.success;
                    

                        // arrange
                     
                        when(mockLocalDataSource.logout()).thenThrow((_) async => outputLocalDataSource);
                        when(mockRemoteDataSource.logout()).thenAnswer((_) async => outputReomteDataSource);
                        
                        // act
                        final result = await appRepositoryImpl.logout();
                       
                        // assert
                        expect(result, equals(const Left(outputLocalDataSource)));
                        
                        
                        verify(mockLocalDataSource.logout());
                        verify(mockRemoteDataSource.logout());
                       

                        
                        verifyNoMoreInteractions(mockLocalDataSource);
                        verifyNoMoreInteractions(mockRemoteDataSource);
                        
                });

              test('should return bad Content or any Failure  when internet is connected and  logout remote data source is fail', () async {
        
                        final outputReomteDataSource=LogoutAuthResponse(false)
                             ..status=ApiInternalStatusCode.failure
                             ..code=ResponseCode.badContent 
                             ..message=ResponseMessage.badContent;
                    

                        // arrange
                        when(mockRemoteDataSource.logout()).thenAnswer((_) async => outputReomteDataSource);
                        // act
                        final result = await appRepositoryImpl.logout();
                        // assert
                        expect(result, equals(Left(DataSourceNetworkError.badContent.getFailure())));
                        verify(mockRemoteDataSource.logout());
                        verifyNoMoreInteractions(mockRemoteDataSource);
                        
                });
                  
                 
              });

              runTestsOffline(()
              {

                 test('should return failure no internet connection when logout', () async {
        
                       
                        // act
                        final result = await appRepositoryImpl.logout();
                       
                        // assert
                        expect(result, equals(Left(DataSourceNetworkError.noInternetConnection.getFailure())));
                      
                        verify(mockNetworkInfo.isConnected);
                      
                        verifyNoMoreInteractions(mockNetworkInfo);
                        
                });


              });
              


            

              

        });
}