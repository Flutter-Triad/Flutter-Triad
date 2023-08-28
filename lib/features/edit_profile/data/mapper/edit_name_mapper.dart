import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/edit_profile/data/mapper/user_attributes_mapper.dart';
import 'package:flutter_triad/features/edit_profile/data/response/edit_name_response.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/edit_name_model.dart';

extension EditNameMapper on EditUserNameResponse {
  EditNameModel toDomain() {
    return EditNameModel(
        message: this.message.onNull(),
        data: this.data?.toDomain(),
        status: this.status.onNull());
  }
}
