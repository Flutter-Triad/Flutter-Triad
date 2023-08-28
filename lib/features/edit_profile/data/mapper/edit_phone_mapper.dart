import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/edit_profile/data/mapper/user_attributes_mapper.dart';
import 'package:flutter_triad/features/edit_profile/data/response/edit_phone_response.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_phone_model.dart';

extension EditPhoneMapper on EditUserPhoneResponse {
  EditPhoneModel toDomain() {
    return EditPhoneModel(
        message: this.message.onNull(),
        data: this.data?.toDomain(),
        status: this.status.onNull());
  }
}
