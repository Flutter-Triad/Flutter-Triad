import 'package:flutter_triad/features/edit_profile/data/request/edit_name_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_name_model.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/edit_name_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class EditNameUseCase implements BaseUseCase<EditNameRequest, EditNameModel> {
  final EditNameRepository _repository;

  EditNameUseCase(this._repository);

  @override
  Future<Either<Failure, EditNameModel>> execute(EditNameRequest input) async {
    return await _repository.editName(EditNameRequest(name: input.name));
  }
}
