import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerCategoryList extends StatelessWidget {
  const ShimmerCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Shimmer.fromColors(
            baseColor: ManagerColors.greyLight,
            highlightColor: ManagerColors.white,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w4,
                vertical: ManagerHeight.h4,
              ),
              height: ManagerHeight.h40,
              width: ManagerWidth.w80,
              decoration: BoxDecoration(
                color: ManagerColors.greyLight,
                borderRadius: BorderRadius.circular(
                  ManagerRadius.r12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
