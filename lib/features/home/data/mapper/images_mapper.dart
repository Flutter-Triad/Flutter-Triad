import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/home/data/response/image_response.dart';
import 'package:flutter_triad/features/home/domain/model/image_model.dart';
import '../../domain/model/images_model.dart';
import '../response/images_response.dart';

extension ImagesMapper on ImagesResponse {
  ImagesModel toDomain() {
    return ImagesModel(
      images: images!.map((e) => e.toDomain()).toList(),
    );
  }
}

extension ImageMapper on ImageResponse {
  ImageModel toDomain() {
    return ImageModel(
      image: image.onNull(),
    );
  }
}
