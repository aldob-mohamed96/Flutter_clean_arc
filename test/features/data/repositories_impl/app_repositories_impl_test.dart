

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';
import 'package:project/features/data/request/requests.dart';
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
      Future<SuccessOperation> logout() => super.noSuchMethod(  Invocation.method(
          #logout,
          [],
        ),
        returnValue: Future<SuccessOperation>.value(
           const SuccessOperation(true)),
        returnValueForMissingStub: Future<SuccessOperation>.value(
          const  SuccessOperation(true)),
      ) as Future<SuccessOperation>;

      @override
      Future<LocalAppData> getLocalApp() => super.noSuchMethod(Invocation.method(
          #getLocalApp,
          [],
        ),
        returnValue: Future<LocalAppData>.value(
           const LocalAppData(AppConstants.arabicLocal)),
        returnValueForMissingStub: Future<LocalAppData>.value(
          const  LocalAppData(AppConstants.arabicLocal)),
      ) as Future<LocalAppData>;

      @override
      Future<SuccessOperation> cashLocalApp(LocalAppRequest? localAppRequest) => super.noSuchMethod(  Invocation.method(
          #cashLocalApp,
          [localAppRequest],
        ),
        returnValue: Future<SuccessOperation>.value(
           const SuccessOperation(true)),
        returnValueForMissingStub: Future<SuccessOperation>.value(
          const  SuccessOperation(true)),
      ) as Future<SuccessOperation>;

      @override
      Future<ThemeModeData> getThemeApp() => super.noSuchMethod(Invocation.method(
          #getThemeApp,
          [],
        ),
        returnValue: Future<ThemeModeData>.value(
           const ThemeModeData(ThemeMode.light)),
        returnValueForMissingStub: Future<ThemeModeData>.value(
          const  ThemeModeData(ThemeMode.light))
        ) as Future<ThemeModeData>;

      @override
      Future<SuccessOperation> cashThemeApp(ThemeModeAppReuest? themeAppRequest) => super.noSuchMethod( Invocation.method(
          #cashThemeApp,
          [themeAppRequest],
        ),
        returnValue: Future<SuccessOperation>.value(
           const SuccessOperation(true)),
        returnValueForMissingStub: Future<SuccessOperation>.value(
          const  SuccessOperation(true)),
      ) as Future<SuccessOperation>;    

      @override
      Future<AppAuthenticationLevelData> getLevelAuthenticationApp() => super.noSuchMethod(Invocation.method(
          #getLevelAuthenticationApp,
          [],
        ),
        returnValue: Future<AppAuthenticationLevelData>.value(
           const AppAuthenticationLevelData(AppAuthenticationLevel.authenticated)),
        returnValueForMissingStub: Future<AppAuthenticationLevelData>.value(
          const  AppAuthenticationLevelData(AppAuthenticationLevel.authenticated)),
      ) as Future<AppAuthenticationLevelData>;
      
      @override
      Future<SuccessOperation> cashLevelAuthenticationApp(AppAuthenticationLevelRequest? appAuthenticationLevelRequest) => super.noSuchMethod(  Invocation.method(
          #cashLevelAuthenticationApp,
          [appAuthenticationLevelRequest],
        ),
        returnValue: Future<SuccessOperation>.value(
           const SuccessOperation(true)),
        returnValueForMissingStub: Future<SuccessOperation>.value(
          const  SuccessOperation(true)),
      ) as Future<SuccessOperation>;


      @override
      Future<TokenData> getToken() => super.noSuchMethod(Invocation.method(
          #getToken,
          [],
        ),
        returnValue: Future<TokenData>.value(
           const TokenData('AppConstants.token')),
        returnValueForMissingStub: Future<TokenData>.value(
          const  TokenData('AppConstants.token')),
      ) as Future<TokenData>;
     
      @override
      Future<SuccessOperation> cashToken(TokenRequest? tokenRequest) => super.noSuchMethod(Invocation.method(
          #cashToken,
          [tokenRequest],
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

  
    group('getting  Locale App', () { 
      
        const output=LocalAppData(AppConstants.defaultLocal); 
        test('should return LocalAppData(Locale Data) when successfully ', () async{
            // arrange
            when(mockLocalDataSource.getLocalApp()).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.getLocalApp();

            // assert
            expect(result, equals(const Right(output)));
            verify(mockLocalDataSource.getLocalApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.getLocalApp()).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.getLocalApp();

            // assert
            expect(result, equals(const Left(Failure.unknown())));
            verify(mockLocalDataSource.getLocalApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

    });
    
    group('cash  Locale App', () { 
      
        const output=SuccessOperation(true); 
        final input=LocalAppRequest(AppConstants.defaultLocal);
        test('should return SuccessOperation(true) when successfully cashed ', () async{
            // arrange
            when(mockLocalDataSource.cashLocalApp(any)).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.cashLocalApp(input);

            // assert
            verify(mockLocalDataSource.cashLocalApp(argThat(isA<LocalAppRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);
            expect(result, equals(const Right(output)));
          


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.cashLocalApp(any)).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.cashLocalApp(input);

            // assert
           
            verify(mockLocalDataSource.cashLocalApp(argThat(isA<LocalAppRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);

            expect(result, equals(const Left(Failure.unknown())));

           
        });

    });
    
    group('getting  theme App', () { 
      
        const output=ThemeModeData(AppConstants.defaultTheme); 
        test('should return ThemeModeData(ThemeMode Data) when successfully ', () async{
            // arrange
            when(mockLocalDataSource.getThemeApp()).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.getThemeApp();

            // assert
            expect(result, equals(const Right(output)));
            verify(mockLocalDataSource.getThemeApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.getThemeApp()).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.getThemeApp();

            // assert
            expect(result, equals(const Left(Failure.unknown())));
            verify(mockLocalDataSource.getThemeApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

    });

    group('cash  Theme App', () { 
      
        const output=SuccessOperation(true); 
        final input= ThemeModeAppReuest(AppConstants.theme);
        test('should return SuccessOperation(true) when successfully cashed ', () async{
            // arrange
            when(mockLocalDataSource.cashThemeApp(any)).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.cashThemeApp(input);

            // assert
            verify(mockLocalDataSource.cashThemeApp(argThat(isA<ThemeModeAppReuest>())));
            verifyNoMoreInteractions(mockLocalDataSource);
            expect(result, equals(const Right(output)));
          


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.cashThemeApp(any)).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.cashThemeApp(input);

            // assert
           
            verify(mockLocalDataSource.cashThemeApp(argThat(isA<ThemeModeAppReuest>())));
            verifyNoMoreInteractions(mockLocalDataSource);

            expect(result, equals(const Left(Failure.unknown())));

           
        });

    });
   
      
    group('getting token App', () { 
      
        const output=TokenData("value token"); 
        test('should return ThemeModeData(ThemeMode Data) when successfully ', () async{
            // arrange
            when(mockLocalDataSource.getToken()).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.getToken();

            // assert
            expect(result, equals(const Right(output)));
            verify(mockLocalDataSource.getToken());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.getToken()).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.getToken();

            // assert
            expect(result, equals(const Left(Failure.unknown())));
            verify(mockLocalDataSource.getToken());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

    });

    group('cash Token App', () { 
      
        const output=SuccessOperation(true); 
        final input= TokenRequest('value token');
        test('should return SuccessOperation(true) when successfully cashed ', () async{
            // arrange
            when(mockLocalDataSource.cashToken(any)).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.cashToken(input);

            // assert
            verify(mockLocalDataSource.cashToken(argThat(isA<TokenRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);
            expect(result, equals(const Right(output)));
          


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.cashToken(any)).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.cashToken(input);

            // assert
           
            verify(mockLocalDataSource.cashToken(argThat(isA<TokenRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);

            expect(result, equals(const Left(Failure.unknown())));

           
        });

    });
   

    group('getting AppAuthenticationlevel App', () { 
      
        const output=AppAuthenticationLevelData(AppAuthenticationLevel.authenticated); 
        test('should return Authentication(AppAuthenticationLevel) when successfully ', () async{
            // arrange
            when(mockLocalDataSource.getLevelAuthenticationApp()).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.getLevelAuthenticationApp();

            // assert
            expect(result, equals(const Right(output)));
            verify(mockLocalDataSource.getLevelAuthenticationApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.getLevelAuthenticationApp()).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.getLevelAuthenticationApp();

            // assert
            expect(result, equals(const Left(Failure.unknown())));
            verify(mockLocalDataSource.getLevelAuthenticationApp());
            verifyNoMoreInteractions(mockLocalDataSource);


           
        });

    });

    group('cash LevelAuthenticationApp App', () { 
      
        const output=SuccessOperation(true); 
        final input= AppAuthenticationLevelRequest(AppAuthenticationLevel.authenticated);
        test('should return SuccessOperation(true) when successfully cashed ', () async{
            // arrange
            when(mockLocalDataSource.cashLevelAuthenticationApp(any)).thenAnswer((_) async =>  output);

            // act
            final result =await appRepositoryImpl.cashLevelAuthenticationApp(input);

            // assert
            verify(mockLocalDataSource.cashLevelAuthenticationApp(argThat(isA<AppAuthenticationLevelRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);
            expect(result, equals(const Right(output)));
          


           
        });

        test('should return Failure cash when getting locale data source of locale ', ()async{
            //arrange
            when(mockLocalDataSource.cashLevelAuthenticationApp(any)).thenThrow((_) async =>const  Failure.unknown() );

            // act
            final result =await appRepositoryImpl.cashLevelAuthenticationApp(input);

            // assert
           
            verify(mockLocalDataSource.cashLevelAuthenticationApp(argThat(isA<AppAuthenticationLevelRequest>())));
            verifyNoMoreInteractions(mockLocalDataSource);

            expect(result, equals(const Left(Failure.unknown())));

           
        });

    });
   
    
    

}