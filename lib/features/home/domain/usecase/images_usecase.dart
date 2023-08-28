import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../model/images_model.dart';
import '../repository/images_repository.dart';

class ImagesUseCase implements BaseGetUseCase {
  final ImagesRepository _repository;

  ImagesUseCase(this._repository);

  @override
  Future<Either<Failure, ImagesModel>> execute() async {
    return await _repository.images();
  }
}
