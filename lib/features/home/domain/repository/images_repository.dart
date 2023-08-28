import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_triad/features/home/domain/model/images_model.dart';

abstract class ImagesRepository {
  Future<Either<Failure, ImagesModel>> images();
}