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
                            await _localDataSource.logout();
                            return Right(response.toDomain()); 
                      
                    } 

                    else
                    {
                          return  Left(Failure(response.code??ResponseCode.unknownError, response.message??ResponseMessage.unknownError));
                    }
            }
            catch (error) 
            {
                    return Left(ExceptionHandling.handleError(error).failure);
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
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setLevelAuthenticationApp(
      AppAuthenticationLevelRequest appAuthenticationLevelRequest) async {
    try {
      return Right(await _localDataSource.setLevelAuthenticationApp(appAuthenticationLevelRequest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, ThemeModeData>> getThemeAppPreferences() async {
    try {
      return Right(await _localDataSource.getThemeAppPreferences());
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setThemeAppPreferences(
      ThemeModeAppReuest themeModeAppReuest) async {
    try {
      return  Right(await _localDataSource.setThemeAppPreferences(themeModeAppReuest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, TokenData>> getToken() async {
    try {
      
      return Right(await _localDataSource.getToken());
    } catch (error) {
       return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> setToken(TokenRequest tokenRequest) async {

    try {
      return Right(await _localDataSource.setToken(tokenRequest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }
}
