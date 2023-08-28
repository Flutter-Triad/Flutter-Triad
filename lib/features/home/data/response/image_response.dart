import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.image)
  String? image;

  ImageResponse({
    this.image,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}
