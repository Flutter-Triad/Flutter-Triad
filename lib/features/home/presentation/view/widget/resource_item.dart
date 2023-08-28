import 'package:flutter_triad/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes_util.dart';

Container resourceItem(HomeController controller, int index, onPressed) {
  return Container(
    alignment: AlignmentDirectional.center,
    width: ManagerWidth.w300,
    margin: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h14,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r14,
      ),
      color: ManagerColors.white,
    ),
    child: InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ManagerRadius.r10),
        ),
        child: controller.image(
          courseAvatar: controller.imagesModel.images[index].image.toString(),
          defaultImage: ManagerAssets.workspace,
        ),
      ),
    ),
  );
}
