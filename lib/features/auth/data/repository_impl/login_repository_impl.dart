import 'package:flutter_triad/features/auth/data/mapper/login_mapper.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/models/login_model.dart';
import '../../domain/repository/login_repository.dart';
import '../data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import '../request/login_request.dart';

class LoginRepoImplement implements LoginRepository {
  RemoteLoginDataSource _remoteLoginDataSource;
  NetworkInfo _networkInfo;

  LoginRepoImplement(this._networkInfo, this._remoteLoginDataSource);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteLoginDataSource.login(loginRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
