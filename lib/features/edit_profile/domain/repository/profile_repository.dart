import 'package:flutter_triad/features/edit_profile/domain/models/profile_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> profile();
}