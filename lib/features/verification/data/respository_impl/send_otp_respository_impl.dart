import 'package:flutter_triad/features/verification/data/data_source/send_otp_remote_date_source.dart';
import 'package:flutter_triad/features/verification/data/mapper/send_otp_mapper.dart';
import 'package:flutter_triad/features/verification/data/request/send_otp_request.dart';
import 'package:flutter_triad/features/verification/domain/models/send_otp_model.dart';
import 'package:flutter_triad/features/verification/domain/repositories/send_otp_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class SendOtpRepositoryImpl implements SendOtpRepository {
  RemoteSendOtpDataSource _remoteSendOtpDataSource;
  NetworkInfo _networkInfo;

  SendOtpRepositoryImpl(this._networkInfo, this._remoteSendOtpDataSource);

  @override
  Future<Either<Failure, SendOtpModel>> sendOtp(
      SendOtpRequest sendOtpRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteSendOtpDataSource.sendOtp(sendOtpRequest);
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
