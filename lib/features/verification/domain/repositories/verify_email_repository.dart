import 'package:flutter_triad/features/verification/data/request/verify_email_request.dart';
import 'package:flutter_triad/features/verification/domain/models/verify_email_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class VerifyEmailRepository {
  Future<Either<Failure, VerifyEmail>> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  );
}
