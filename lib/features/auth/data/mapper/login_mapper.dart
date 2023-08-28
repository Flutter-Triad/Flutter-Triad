


import 'package:flutter_triad/core/extensions/extensions.dart';

import '../../domain/models/login_model.dart';
import '../response/login_response.dart';

extension LoginMapper on LoginResponse{
  toDomain() {
      return Login(token: this.token.onNull());
  }
}