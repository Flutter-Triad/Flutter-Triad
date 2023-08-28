import 'package:flutter_triad/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerAllCoursesList extends StatelessWidget {
  const ShimmerAllCoursesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.shimmerItemCounts,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: ManagerHeight.h110,
          margin: EdgeInsetsDirectional.only(
            bottom: ManagerWidth.w20,
          ),
          child: Shimmer.fromColors(
            baseColor: ManagerColors.greyLight,
            highlightColor: ManagerColors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ManagerWidth.w128,
                  height: ManagerHeight.h110,
                  decoration: BoxDecoration(
                    color: ManagerColors.greyLight,
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r12,
                    ),
                  ),
                ),
                SizedBox(
                  width: ManagerWidth.w10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ManagerWidth.w40,
                      padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w6,
                        vertical: ManagerHeight.h6,
                      ),
                      margin: EdgeInsets.only(
                        top: ManagerHeight.h6,
                        bottom: ManagerHeight.h8,
                      ),
                      decoration: BoxDecoration(
                        color: ManagerColors.backgroundCourses,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r4,
                        ),
                      ),
                    ),
                    Container(
                      height: ManagerHeight.h10,
                      width: ManagerWidth.w100,
                      decoration: BoxDecoration(
                        color: ManagerColors.backgroundCourses,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r4,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: ManagerHeight.h10,
                      width: ManagerWidth.w40,
                      decoration: BoxDecoration(
                        color: ManagerColors.backgroundCourses,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r4,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: ManagerHeight.h10,
                    bottom: ManagerHeight.h10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: ManagerHeight.h40,
                        width: ManagerWidth.w20,
                        decoration: BoxDecoration(
                          color: ManagerColors.backgroundCourses,
                          borderRadius: BorderRadius.circular(
                            ManagerRadius.r4,
                          ),
                        ),
                      ),
                      Container(
                        width: ManagerWidth.w40,
                        decoration: BoxDecoration(
                          color: ManagerColors.backgroundCourses,
                          borderRadius: BorderRadius.circular(
                            ManagerRadius.r4,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
