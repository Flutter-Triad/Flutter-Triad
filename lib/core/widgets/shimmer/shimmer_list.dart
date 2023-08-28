import 'package:flutter_triad/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_assets.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerList extends StatelessWidget {
  bool isHasCard;
  int numLines;
  int expandedCard;
  bool isHasLastLine;

  ShimmerList({
    super.key,
    this.isHasCard = true,
    this.numLines = 2,
    this.expandedCard = 1,
    this.isHasLastLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: ManagerColors.greyLight,
          highlightColor: ManagerColors.white,
          child: ListView.builder(
              itemCount: Constants.shimmerItemCounts,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h8,
                    horizontal: ManagerWidth.w12,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ManagerColors.shadowCategory,
                        offset: Offset(0, 5),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ManagerHeight.h12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: expandedCard,
                            child: Container(
                              height: ManagerHeight.h60,
                              decoration: BoxDecoration(
                                color: ManagerColors.white,
                                image: const DecorationImage(
                                  image: AssetImage(ManagerAssets.logo),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: ManagerColors.shadowCategory,
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ManagerWidth.w12,
                          ),
                          Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsetsDirectional.only(
                                  end: ManagerWidth.w24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...List.generate(
                                      numLines,
                                      (index) => Column(
                                        children: [
                                          Container(
                                            height: ManagerHeight.h10,
                                            width: double.infinity,
                                            color: ManagerColors.white,
                                          ),
                                          SizedBox(
                                            height: ManagerHeight.h10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    isHasLastLine ? Container(
                                      height: ManagerHeight.h10,
                                      margin: EdgeInsetsDirectional.only(
                                        end: ManagerWidth.w50,
                                      ),
                                      width: double.infinity,
                                      color: ManagerColors.white,
                                    ) : Container(),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
