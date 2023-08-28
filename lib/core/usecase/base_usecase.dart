import '../error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out>{
  Future<Either<Failure,Out>> execute(In input);
}

abstract class BaseGetUseCase<Out>{
  Future<Either<Failure,Out>> execute();
}