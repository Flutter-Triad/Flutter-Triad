import 'edit_password_attributes_model.dart';

class EditPasswordDataModel {
  String? type;
  int? id;
  EditPasswordAttributesModel? attributes;

  EditPasswordDataModel(
      {required this.type, required this.id, required this.attributes});
}
