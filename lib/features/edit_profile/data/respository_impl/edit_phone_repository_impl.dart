import 'package:flutter_triad/features/edit_profile/data/data_source/edit_phone_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/mapper/edit_phone_mapper.dart';
import 'package:flutter_triad/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_phone_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/edit_phone_repository.dart';

class EditPhoneRepoImplement implements EditPhoneRepository {
  RemoteEditPhoneDataSource _remoteEditPhoneDataSource;
  NetworkInfo _networkInfo;

  EditPhoneRepoImplement(this._networkInfo, this._remoteEditPhoneDataSource);

  @override
  Future<Either<Failure, EditPhoneModel>> editPhone(
      EditPhoneRequest request) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteEditPhoneDataSource.editPhone(request);
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
