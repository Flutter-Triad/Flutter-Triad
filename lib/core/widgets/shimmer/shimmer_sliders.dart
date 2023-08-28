import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerSliders extends StatelessWidget {
  const ShimmerSliders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: ManagerColors.greyLight,
        highlightColor: ManagerColors.white,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: ManagerHeight.h10,
            horizontal: ManagerWidth.w8,
          ),
          height: ManagerHeight.h180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ManagerColors.greyLight,
            borderRadius: BorderRadius.circular(
              ManagerRadius.r12,
            ),
          ),
        ),
      ),
    );
  }
}
