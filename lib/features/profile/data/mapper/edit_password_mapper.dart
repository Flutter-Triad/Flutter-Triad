import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/profile/data/mapper/edit_password_data_mapper.dart';
import 'package:flutter_triad/features/profile/data/response/edit_password_response.dart';
import 'package:flutter_triad/features/profile/domain/model/edit_password_model.dart';

extension EditPasswordMapper on EditPasswordResponse {
  toDomain() => EditPasswordModel(
      status: this.status.onNull(),
      data: this.data?.toDomain(),
      message: this.message.onNull());
}
