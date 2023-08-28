import 'package:flutter_triad/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_phone_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class EditPhoneRepository {
  Future<Either<Failure, EditPhoneModel>> editPhone(EditPhoneRequest request);
}
