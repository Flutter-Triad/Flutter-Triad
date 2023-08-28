import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/edit_profile/data/response/profile_attributes_response.dart';
import 'package:flutter_triad/features/edit_profile/domain/models/profile_attributes_model.dart';

extension ProfileAttributesMapper on ProfileAttributesResponse {
  ProfileAttributesModel toDomain() => ProfileAttributesModel(
        name: this.name.onNull(),
        email: this.email.onNull(),
        phone: this.phone.onNull(),
        avatar: this.avatar.onNull(),
      );
}
