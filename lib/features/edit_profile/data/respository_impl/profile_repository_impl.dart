import 'package:flutter_triad/features/edit_profile/data/data_source/profile_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/mapper/profile_mapper.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/profile_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/profile_repository.dart';

class ProfileRepoImplement implements ProfileRepository {
  RemoteProfileDataSource _remoteProfileDataSource;
  NetworkInfo _networkInfo;

  ProfileRepoImplement(this._networkInfo, this._remoteProfileDataSource);

  @override
  Future<Either<Failure, ProfileModel>> profile() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteProfileDataSource.profile();
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
