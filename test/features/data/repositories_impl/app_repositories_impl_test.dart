import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/service/network_info.dart';
import 'package:project/features/data/data_source/local/app_local_data_source.dart';
import 'package:project/features/data/data_source/remote/app_remote_data_source.dart';
import 'package:project/features/data/repositories_impl/app_repositories_impl.dart';

import 'app_repositories_impl_test.mocks.dart';



@GenerateNiceMocks([MockSpec<RemoteDataSourceImpl>()])
@GenerateNiceMocks([MockSpec<LocalDataSourceImpl>()])
@GenerateNiceMocks([MockSpec<NetworkInfoImpl>()])
void main() {
 
MockRemoteDataSourceImpl mockRemoteDataSource;
MockLocalDataSourceImpl mockLocalDataSource;
MockNetworkInfoImpl mockNetworkInfo;
AppRepositoryImpl appRepositoryImpl;

setUp(() {

mockRemoteDataSource = MockRemoteDataSourceImpl();
mockLocalDataSource = MockLocalDataSourceImpl();
mockNetworkInfo = MockNetworkInfoImpl();

appRepositoryImpl = AppRepositoryImpl(
remoteDataSource: mockRemoteDataSource,
localDataSource: mockLocalDataSource,
networkInfo: mockNetworkInfo,
);

});

  void runTestsOnline(Function body) {
    mockNetworkInfo=MockNetworkInfoImpl();
    group('device is online', () {
      
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    mockNetworkInfo=MockNetworkInfoImpl();
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

group('logout', () {

test('should return SuccessOperation(true) when logout is successfull', () async {



 });

});
}