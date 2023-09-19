import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnection _internetConnection;

  NetworkInfoImp(this._internetConnection);

  @override
  Future<bool> get isConnected => _internetConnection.hasInternetAccess;
}
