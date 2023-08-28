
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/auth/data/response/logout_response.dart';
import 'package:flutter_triad/features/auth/domain/models/logout_model.dart';

extension LogoutMapper on LogoutResponse{
  toDomain() =>
      Logout(status: this.status.onNull());
}