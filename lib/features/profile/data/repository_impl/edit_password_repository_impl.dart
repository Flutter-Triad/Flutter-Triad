import 'package:flutter_triad/features/profile/data/data_source/edit_password_remote_data_source.dart';
import 'package:flutter_triad/features/profile/data/mapper/edit_password_mapper.dart';
import 'package:flutter_triad/features/profile/data/request/edit_password_request.dart';
import 'package:flutter_triad/features/profile/domain/model/edit_password_model.dart';
import 'package:flutter_triad/features/profile/domain/repository/edit_password_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class EditPasswordRepoImpl implements EditPasswordRepository {
  RemoteEditPasswordDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  EditPasswordRepoImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, EditPasswordModel>> editPassword(
      EditPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteDataSource.editPassword(request);
        return Right(response.toDomain());
      } catch (e) {
        try {
          return Left(Failure(ResponseCode.INTERNAL_SERVER_ERROR,
              ManagerStrings.INTERNAL_SERVER_ERROR));
        } catch (e) {
          return Left(Failure(ResponseCode.UNKNOWN, ManagerStrings.UNKNOWN));
        }
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
