import 'package:flutter_triad/core/base_model/base_model.dart';

import 'user_attributes_model.dart';

class EditNameModel extends BaseModel {
  bool? status;
  AttributesUserModel? data;

  EditNameModel(
      {required super.message, required this.status, required this.data});
}
