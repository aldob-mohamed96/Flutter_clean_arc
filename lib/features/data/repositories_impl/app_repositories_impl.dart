import 'package:flutter/material.dart';
import 'package:project/features/domain/entity/data_value.dart';

import '../../../core/resources/export_file.dart';
import '../../domain/entity/logout.dart';
import '../request/requests.dart';

class AppRepositoryImpl implements AppRepository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AppRepositoryImpl(
      {required NetworkInfo networkInfo,
      required RemoteDataSource remoteDataSource,
      required LocalDataSource localDataSource})
      : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, Logout>> logout() async {
    if (await _networkInfo.isConnected) 
    {
            try 
            {
                    final response = await _remoteDataSource.logout();
                    if (response.status == ApiInternalStatusCode.success) 
                    {
                          final logout = response.toDomain();
                          if (logout.isLoggout) 
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
  Future<Either<Failure, AppAuthenticationLevel>>
      getLevelAuthenticationApp() async {
    try {
      return Right(await _localDataSource.getLevelAuthenticationApp());
    } catch (error) {
      return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setLevelAuthenticationApp(
      AppAuthenticationLevelRequest appAuthenticationLevelRequest) async {
    try {
      return Right(await _localDataSource.setLevelAuthenticationApp(appAuthenticationLevelRequest));
    } catch (error) {
      return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, ThemeModeData>> getThemeAppPreferences() async {
    try {
      return Right(await _localDataSource.getThemeAppPreferences());
    } catch (error) {
      return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setThemeAppPreferences(
      ThemeModeAppReuest themeModeAppReuest) async {
    try {
      return  Right(await _localDataSource.setThemeAppPreferences(themeModeAppReuest));
    } catch (error) {
      return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, TokenData>> getToken() async {
    try {
      
      return Right(await _localDataSource.getToken());
    } catch (error) {
       return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setToken(TokenRequest tokenRequest) async {

    try {
      return Right(await _localDataSource.setToken(tokenRequest));
    } catch (error) {
      return const Left(Failure.unknown());
    }
  }
}
