import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/core/internet_checker/interent_checker.dart';
import 'package:flutter_triad/features/home/data/data_source/remote_data_source.dart';
import 'package:flutter_triad/features/home/data/mapper/images_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_triad/features/home/domain/model/images_model.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/images_repository.dart';

class ImagesRepositoryImpl implements ImagesRepository {
  final RemoteHomeDataSource _remoteHomeDataSource;
  final NetworkInfo _networkInfo;

  ImagesRepositoryImpl(this._remoteHomeDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ImagesModel>> images() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteHomeDataSource.images();
        return Right(response.toDomain());
      } catch (e) {
        return Left(
            ErrorHandler.handle(e).failure
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
