import 'package:flutter_triad/features/notifications/domain/model/notifications_model.dart';
import 'package:flutter_triad/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class NotificationsUseCase implements BaseGetUseCase {
  final NotificationsRepository _repository;

  NotificationsUseCase(this._repository);

  @override
  Future<Either<Failure, NotificationsModel>> execute() async {
    return await _repository.notifications();
  }
}
