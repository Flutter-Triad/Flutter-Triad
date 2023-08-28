import 'package:flutter_triad/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_phone_model.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/edit_phone_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class EditPhoneUseCase
    implements BaseUseCase<EditPhoneRequest, EditPhoneModel> {
  final EditPhoneRepository _repository;

  EditPhoneUseCase(this._repository);

  @override
  Future<Either<Failure, EditPhoneModel>> execute(
      EditPhoneRequest input) async {
    return await _repository.editPhone(EditPhoneRequest(phone: input.phone));
  }
}
