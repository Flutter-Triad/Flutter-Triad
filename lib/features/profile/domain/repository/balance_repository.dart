import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../model/balance_model.dart';

abstract class BalanceRepository {
  Future<Either<Failure, BalanceModel>> balance();
}