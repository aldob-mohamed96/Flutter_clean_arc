import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/resources/export_file.dart';

class MockDataConnectionChecker extends Mock implements InternetConnectionChecker {}
void main() {
  late MockDataConnectionChecker mockDataConnectionChecker;
  late NetworkInfo networkInfo;
 
   setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture =Future.value(true);

        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        final result =await networkInfo.isConnected;
        // assert
        verify(mockDataConnectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}