import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/features/auth/data/data_source/remote_data_source.dart';
import 'package:flutter_triad/features/auth/data/mapper/logout_mapper.dart';
import 'package:flutter_triad/features/auth/domain/models/logout_model.dart';
import 'package:flutter_triad/features/auth/domain/repository/logout_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class LogoutRepoImplement implements LogoutRepository {
  RemoteLogoutDataSource _remoteLogoutDataSource;
  NetworkInfo _networkInfo;

  LogoutRepoImplement(this._networkInfo, this._remoteLogoutDataSource);

  @override
  Future<Either<Failure, Logout>> logout() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteLogoutDataSource.logout();
        return Right(
          response.toDomain(),
        );
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}
