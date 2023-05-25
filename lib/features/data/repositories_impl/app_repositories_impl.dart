



import 'package:flutter/src/material/app.dart';

import '../../../core/resources/export_file.dart';
import '../../domain/entity/logout.dart';
import '../request/requests.dart';


class AppRepositoryImpl implements AppRepository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  AppRepositoryImpl({required NetworkInfo networkInfo,required RemoteDataSource remoteDataSource,required LocalDataSource localDataSource })
  :_networkInfo=networkInfo,
  _remoteDataSource=remoteDataSource,
  _localDataSource=localDataSource
  
  ;
  
  @override
  Future<Either<Failure, Logout>> logout() async 
  {
    
            if (await _networkInfo.isConnected)
            {
                      try 
                      {
                            final response =await _remoteDataSource.logout();
                            if (response.status == ApiInternalStatusCode.success) 
                            {
                              final logout=response.toDomain();  
                              if(logout.isLoggout)
                              {
                                await _localDataSource.logout(); 
                              }
                              return Right(logout);
                            }
                            else 
                            {
                              return const Left(AppConstants.unknownfailure);
                            }
                      }
                    catch (error)
                      {
                            return Left(NetworkException.handleNetworkError(error).failure);
                      }
            } 
            else 
            {
                    return Left(DataSourceNetworkError.noInternetConnection.getFailure());
            }
  }
  
  @override
  Future<Either<Failure, AppAuthenticationLevel>> getLevelAuthenticationApp() async
  {
        try
        {
          return Right(await _localDataSource.getLevelAuthenticationApp());
        }
        catch(error)
        {
            return const Left(AppConstants.unknownfailure);
        }
  }
  
  @override
  Future<Either<Failure, Unit>> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest) async{
      
        try
        {
           _localDataSource.setLevelAuthenticationApp(appAuthenticationLevelRequest);
           return const Right(unit);
        }
        catch(error)
        {
           return const Left(AppConstants.unknownfailure);
        }

  }

  @override
  Future<Either<Failure, ThemeMode>> getThemeAppPreferences()async{
        try
        {
            return Right(await _localDataSource.getThemeAppPreferences());
        }
        catch(error)
        {
            return const Left(AppConstants.unknownfailure);
        }
  }

  @override
  Future<Either<Failure, Unit>> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest) async{

      try
        {
           _localDataSource.setThemeAppPreferences(themeModeAppReuest);
            return const Right(unit);
        }
        catch(error)
        {
           return const Left(AppConstants.unknownfailure);
        }

  }
  
  @override
  Future<Either<Failure, String>> getToken() async{
    try
        {
            final result=await _localDataSource.getToken();
            return  Right(result);
        }
        catch(error)
        {
           return const Left(AppConstants.unknownfailure);
        }
  }
  
  @override
  Future<Either<Failure, Unit>> setToken(TokenRequest tokenRequest) async{
   try
        {
           _localDataSource.setToken(tokenRequest);
            return const Right(unit);
        }
        catch(error)
        {
           return const Left(AppConstants.unknownfailure);
        }
  }


}