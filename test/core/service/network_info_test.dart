import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:project/core/service/network_info.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {

  @override
  Future<bool> get hasConnection => super.noSuchMethod(Invocation.getter(#hasConnection), returnValue: Future<bool>.value(false), returnValueForMissingStub: Future<bool>.value(false)) as Future<bool>;
  
}

void main() {

  late MockInternetConnectionChecker internetConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;
  setUp(() {
    internetConnectionChecker = MockInternetConnectionChecker();

    networkInfoImpl =
        NetworkInfoImpl(internetConnectionChecker);
  });

  group('isConnected', () {
   
      test('should forward the call to DataConnectionChecker has Connection', () async {
      final tHasConnectionFuture= await Future<bool>.value(true);
      when(internetConnectionChecker.hasConnection).thenAnswer((_) async =>  tHasConnectionFuture);
      final result =await networkInfoImpl.isConnected;
      verify(internetConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });


    test('should forward the call to DataConnectionChecker has not Connection', () async {
      final tHasConnectionFuture= await Future<bool>.value(false);
      when(internetConnectionChecker.hasConnection).thenAnswer((_) async =>  tHasConnectionFuture);
      final result =await networkInfoImpl.isConnected;
      verify(internetConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
