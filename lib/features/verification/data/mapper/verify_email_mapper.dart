

import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/verification/data/response/verify_email_response.dart';
import 'package:flutter_triad/features/verification/domain/models/verify_email_model.dart';

extension VerifyEmailMapper on VerifyEmailResponse{
  toDomain() => VerifyEmail(status: this.status?.onNull());
}