



import '../../../core/resources/export_file.dart';


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
  Future<Either<Failure, bool>> logout() async 
  {
    
            if (await _networkInfo.isConnected)
            {
                      try 
                      {
                            final response =await _remoteDataSource.logout();
                            if (response.status == ApiInternalStatusCode.success) 
                            {
                              bool isLoggedOut=response.toDomain();  
                              if(isLoggedOut)
                              {
                                await _localDataSource.logout(); 
                              }
                              return Right(isLoggedOut);
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
  /*
  @override
  Future<Either<Failure, Output>> functionName(InputRequest paginationData) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =await _driverOrdersRemoteDataSource.getDriverOrders(paginationData);
        if (response.status == ApiInternalStatusCode.success) 
        {
        
          return Right(response.toDomain());
        }
        else if(response.status == ApiInternalStatusCode.failure)
        {
           return  Left(NetworkException.handleNetworkError(response.).failure);
        }
        else 
        {
          return const Left(AppConstants.unknownfailure);
        }
      } catch (error) {

        return Left(NetworkException
            .handleNetworkError(error)
            .failure);
      }
    } else {
    
        return Left(DataSourceNetworkError.noInternetConnection.getFailure());
      
    }
  }
*/

}