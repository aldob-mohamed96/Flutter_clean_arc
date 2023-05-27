import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract interface class NetworkInfo{
  Future<bool> get isConnected;
}
final class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(this._internetConnectionChecker);
  @override
  Future<bool> get isConnected async => await _internetConnectionChecker.hasConnection;
}