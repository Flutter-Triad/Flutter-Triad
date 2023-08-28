import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/profile/data/response/edit_password_attributes_response.dart';
import 'package:flutter_triad/features/profile/domain/model/edit_password_attributes_model.dart';

extension EditPasswordAttributesMapper on EditPasswordAttributesResponse {
  EditPasswordAttributesModel toDomain() => EditPasswordAttributesModel(
      name: this.name.onNull(),
      email: this.email.onNull(),
      phone: this.phone.onNull(),
      avatar: this.avatar.onNull());
}
