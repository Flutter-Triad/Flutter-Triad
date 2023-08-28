import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/features/home/presentation/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/shimmer/shimmer_sliders.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.isLoading == 0
            ? const ShimmerSliders()
            : CarouselSlider(
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      viewportFraction: 0.85,
                      autoPlay: true,
                      height: ManagerHeight.h160,
                      onPageChanged: (index, reason) {
                        controller.change(index);
                      },
                    ),
                    items: controller.imagesModel.images.map(
                      (i) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w10,
                            vertical: ManagerHeight.h10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r14),
                            image: DecorationImage(
                              image: controller.imageProvider(
                                courseAvatar: i.image
                                    .toString(),
                                defaultImage: ManagerAssets.workspace,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
      },
    );
  }
}
