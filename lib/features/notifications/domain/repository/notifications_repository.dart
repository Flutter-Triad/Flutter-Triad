import 'package:flutter_triad/features/notifications/domain/model/notifications_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class NotificationsRepository{
  Future<Either<Failure, NotificationsModel>> notifications();
}