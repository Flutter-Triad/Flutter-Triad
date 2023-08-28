import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/forget_password/data/response/forget_password_response.dart';
import 'package:flutter_triad/features/forget_password/domain/models/forget_password.dart';

extension ForgetPasswordMapper on ForgetPasswordResponse{
  toDomain() =>
      ForgetPassword(status: this.status!.onNull());
}