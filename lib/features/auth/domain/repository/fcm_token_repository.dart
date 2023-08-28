import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/features/auth/data/request/fvm_token_request.dart';
import 'package:flutter_triad/features/auth/domain/models/fcm_token_model.dart';
import 'package:dartz/dartz.dart';

abstract class FcmTokenRepository {
  Future<Either<Failure, FcmTokenModel>> fcmToken(
    FcmTokenRequest fcmTokenRequest,
  );
}
