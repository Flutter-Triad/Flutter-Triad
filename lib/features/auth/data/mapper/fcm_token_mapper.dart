import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/auth/data/response/fcm_token_response.dart';
import 'package:flutter_triad/features/auth/domain/models/fcm_token_model.dart';

extension FcmTokenMapper on FcmTokenResponse {
  FcmTokenModel toDomain() {
    return FcmTokenModel(
      status: status.onNull(), message: message.onNull(),
    );
  }
}
