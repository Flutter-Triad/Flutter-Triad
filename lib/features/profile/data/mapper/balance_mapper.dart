import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/profile/data/response/balance_response.dart';
import 'package:flutter_triad/features/profile/domain/model/balance_model.dart';

extension BalanceMapper on BalanceResponse {
  BalanceModel toDomain() => BalanceModel(balance: this.balance.onNull());
}
