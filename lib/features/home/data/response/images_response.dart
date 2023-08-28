import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'image_response.dart';

part 'images_response.g.dart';

@JsonSerializable()
class ImagesResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<ImageResponse>? images;

  ImagesResponse({
    this.images,
  });

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}
