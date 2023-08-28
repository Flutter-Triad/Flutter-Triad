import 'package:flutter_triad/features/verification/data/data_source/verify_email_remote_date_source.dart';
import 'package:flutter_triad/features/verification/data/mapper/verify_email_mapper.dart';
import 'package:flutter_triad/features/verification/data/request/verify_email_request.dart';
import 'package:flutter_triad/features/verification/domain/models/verify_email_model.dart';
import 'package:flutter_triad/features/verification/domain/repositories/verify_email_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  RemoteVerifyEmailDataSource _remoteVerifyEmailDataSource;
  NetworkInfo _networkInfo;

  VerifyEmailRepositoryImpl(
      this._networkInfo, this._remoteVerifyEmailDataSource);

  @override
  Future<Either<Failure, VerifyEmail>> verifyEmail(
      VerifyEmailRequest verifyEmailRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response =
            await _remoteVerifyEmailDataSource.verifyEmail(verifyEmailRequest);
        if (response.status != null) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ResponseCode.BAD_REQUEST, ""));
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
