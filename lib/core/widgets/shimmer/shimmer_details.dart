import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/manager_colors.dart';
import '../../resources/manager_sizes_util.dart';

class ShimmerDetails extends StatelessWidget {
  const ShimmerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: ManagerColors.grey,
        highlightColor: ManagerColors.white,
        direction: ShimmerDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h10, horizontal: ManagerWidth.w8),
              height: ManagerHeight.h180,
              width: double.infinity,
              color: ManagerColors.secondaryColor,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              color: ManagerColors.secondaryColor,
              height: ManagerHeight.h20,
              width: ManagerWidth.w100,
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
            ),
            SizedBox(
              height: ManagerHeight.h8,
            ),
            Container(
              color: ManagerColors.secondaryColor,
              height: ManagerHeight.h40,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
            ),
            SizedBox(
              height: ManagerHeight.h8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: ManagerColors.secondaryColor,
                    height: ManagerHeight.h20,
                    width: ManagerWidth.w100,
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: ManagerColors.secondaryColor,
                    height: ManagerHeight.h20,
                    width: ManagerWidth.w100,
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
