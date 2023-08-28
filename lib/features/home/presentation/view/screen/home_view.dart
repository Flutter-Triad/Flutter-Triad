import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/widgets/pop_cope_widget.dart';
import 'package:flutter_triad/features/home/presentation/controller/home_controller.dart';
import 'package:flutter_triad/features/home/presentation/view/widget/custom_banner.dart';
import 'package:flutter_triad/features/home/presentation/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/error_container.dart';
import '../../../../../core/widgets/shimmer/shimmer_resource_list.dart';
import '../widget/home_app_bar.dart';
import '../widget/resource_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: homeAppBar(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                controller.performRefresh();
              },
              child: controller.isLoading == 2
                  ? SingleChildScrollView(
                      child: errorContainer(
                        controller.errorMessage,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h20,
                        horizontal: ManagerWidth.w12,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: ManagerHeight.h160,
                            child: const CustomBanner(),
                          ),
                          SizedBox(height: ManagerHeight.h10),
                          CustomText(
                            name: ManagerStrings.baseItems,
                            nameButton: ManagerStrings.viewAll,
                            buttonColor: ManagerColors.primaryColor,
                            onPressed: () {},
                          ),
                          Container(
                            height: ManagerHeight.h400,
                            child: controller.isLoading == 1
                                ? ListView.builder(
                                    itemCount:
                                        controller.imagesModel.images!.length.onNull(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return resourceItem(
                                        controller,
                                        index,
                                        () {
                                        },
                                      );
                                    },
                                  )
                                : ShimmerResourceList(),
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
