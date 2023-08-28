import 'package:flutter_triad/features/forget_password/data/data_souces/remote_data_source.dart';
import 'package:flutter_triad/features/forget_password/data/mapper/forget_password_mapper.dart';
import 'package:flutter_triad/features/forget_password/data/request/forget_password_request.dart';
import 'package:flutter_triad/features/forget_password/domain/models/forget_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_triad/features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  ForgetPasswordDataSource _forgetPasswordDataSource;
  NetworkInfo _networkInfo;

  ForgetPasswordRepositoryImpl(
      this._networkInfo, this._forgetPasswordDataSource);

  @override
  Future<Either<Failure, ForgetPassword>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _forgetPasswordDataSource
            .forgetPassword(forgetPasswordRequest);
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
