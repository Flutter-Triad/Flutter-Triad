import 'package:flutter_triad/features/edit_profile/data/data_source/edit_name_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/mapper/edit_name_mapper.dart';
import 'package:flutter_triad/features/edit_profile/data/request/edit_name_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/edit_name_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/models/edit_name_model.dart';

class EditNameRepoImplement implements EditNameRepository {
  RemoteEditNameDataSource _remoteEditNameDataSource;
  NetworkInfo _networkInfo;

  EditNameRepoImplement(this._networkInfo, this._remoteEditNameDataSource);

  @override
  Future<Either<Failure, EditNameModel>> editName(EditNameRequest request) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteEditNameDataSource.editName(request);
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
