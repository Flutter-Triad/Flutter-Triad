import 'package:flutter_triad/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerAllResourceList extends StatelessWidget {
  const ShimmerAllResourceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.shimmerItemCounts,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ManagerColors.greyLight,
          highlightColor: ManagerColors.white,
          child: Container(
            margin: EdgeInsetsDirectional.only(
              top: ManagerHeight.h20,
              bottom: ManagerHeight.h20,
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
            ),
            height: ManagerHeight.h280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ManagerRadius.r14,
              ),
              color: ManagerColors.white,
            ),
          ),
        );
      },
    );
  }
}
