import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/auth/data/response/register_response.dart';
import 'package:flutter_triad/features/auth/domain/models/register_model.dart';

extension RegisterMapper on RegisterResponse{
  toDomain() =>
      Register(status: this.status.onNull());
}