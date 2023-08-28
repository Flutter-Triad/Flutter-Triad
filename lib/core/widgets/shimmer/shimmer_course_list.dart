import 'package:flutter_triad/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerCourseList extends StatelessWidget {
  const ShimmerCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.shimmerItemCounts,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: ManagerHeight.h180,
          margin: EdgeInsetsDirectional.only(
            end: ManagerWidth.w20,
          ),
          child: Shimmer.fromColors(
            baseColor: ManagerColors.greyLight,
            highlightColor: ManagerColors.white,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w12,
                end: ManagerWidth.w12,
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h12,
              ),
              width: ManagerWidth.w300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ManagerRadius.r10,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ManagerHeight.h160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ManagerColors.greyLight,
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w6,
                      vertical: ManagerHeight.h6,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.greyLight,
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  Container(
                    width: ManagerWidth.w80,
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w6,
                      vertical: ManagerHeight.h6,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.greyLight,
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  Container(
                    width: ManagerWidth.w120,
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w6,
                      vertical: ManagerHeight.h6,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.greyLight,
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
