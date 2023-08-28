import 'package:flutter_triad/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:flutter_triad/features/notifications/data/mapper/notifications_mapper.dart';
import 'package:flutter_triad/features/notifications/domain/model/notifications_model.dart';
import 'package:flutter_triad/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class NotificationsRepoImpl implements NotificationsRepository {
  RemoteNotificationsDataSource _remoteNotificationsDataSource;
  NetworkInfo _networkInfo;

  NotificationsRepoImpl(
    this._remoteNotificationsDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, NotificationsModel>> notifications() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteNotificationsDataSource.notifications();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
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
