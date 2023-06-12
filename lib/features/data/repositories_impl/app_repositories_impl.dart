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
  Future<Either<Failure, AppAuthenticationLevelData>> getLevelAuthenticationApp() async {
    try {
      return Right(await _localDataSource.getLevelAuthenticationApp());
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> cashLevelAuthenticationApp(
      AppAuthenticationLevelRequest appAuthenticationLevelRequest) async {
    try {
      return Right(await _localDataSource.cashLevelAuthenticationApp(appAuthenticationLevelRequest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, ThemeModeData>> getThemeApp() async {
    try {
      return Right(await _localDataSource.getThemeApp());
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> cashThemeApp(
      ThemeModeAppReuest themeModeAppReuest) async {
    try {
      return  Right(await _localDataSource.cashThemeApp(themeModeAppReuest));
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
  Future<Either<Failure, SuccessOperation>> cashToken(TokenRequest tokenRequest) async {

    try {
      return Right(await _localDataSource.cashToken(tokenRequest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }
  
  @override
  Future<Either<Failure, SuccessOperation>> cashLocalApp(LocalAppRequest localAppRequest)async {
    try {
      return Right(await _localDataSource.cashLocalApp(localAppRequest));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }
  
  @override
  Future<Either<Failure, LocalAppData>> getLocalApp()async {
    try {
      
      return Right(await _localDataSource.getLocalApp());
    } catch (error) {
       return Left(ExceptionHandling.handleError(error).failure);
    }
  }
}
