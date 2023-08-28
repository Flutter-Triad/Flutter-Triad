import 'package:flutter_triad/core/base_model/base_model.dart';

class FcmTokenModel extends BaseModel {
  bool? status;

  FcmTokenModel({
    required this.status,
    required super.message,
  });
}
