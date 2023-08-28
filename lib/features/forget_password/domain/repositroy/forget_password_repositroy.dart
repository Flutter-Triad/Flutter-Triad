import 'package:flutter_triad/features/forget_password/data/request/forget_password_request.dart';
import 'package:flutter_triad/features/forget_password/domain/models/forget_password.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ForgetPassword>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}
