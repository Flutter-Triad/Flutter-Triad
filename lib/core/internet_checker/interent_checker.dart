import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo{
  Future<bool>  get isConnected;
}

class NetworkInfoImp implements NetworkInfo{

  final InternetConnectionCheckerPlus _internetConnectionChecker;
  NetworkInfoImp(this._internetConnectionChecker);
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}