import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/reset_password_request.dart';
import '../models/reset_password.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, ResetPassword>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
