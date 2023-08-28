import 'package:flutter_triad/features/edit_profile/domain/models/edit_name_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/edit_name_request.dart';

abstract class EditNameRepository {
  Future<Either<Failure, EditNameModel>> editName(EditNameRequest request);
}