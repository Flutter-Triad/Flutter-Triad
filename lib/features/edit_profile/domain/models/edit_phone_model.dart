

import '../../../../core/base_model/base_model.dart';
import 'user_attributes_model.dart';

class EditPhoneModel extends BaseModel {
  bool? status;
  AttributesUserModel? data;

  EditPhoneModel(
      {required super.message, required this.status, required this.data});
}
