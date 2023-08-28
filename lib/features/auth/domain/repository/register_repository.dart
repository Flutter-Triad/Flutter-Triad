import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/features/auth/data/request/register_request.dart';
import 'package:flutter_triad/features/auth/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository{
  Future<Either<Failure,Register>> register(RegisterRequest registerRequest);
}