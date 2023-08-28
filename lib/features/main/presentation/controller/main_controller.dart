import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/features/home/presentation/view/screen/home_view.dart';
import 'package:flutter_triad/features/profile/presentation/view/screen/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    HomeView(),
    Container(),
    ProfileView(),
  ];

  void navigate(int index) {
    persistentTabController.jumpToTab(index);
  }
}

void changeMainCurrentIndex(int index) {
  try {
    Get.find<MainController>().navigate(index);
    debugPrint("The Main Controller Index Changed");
  } catch (e) {
    debugPrint(e.toString());
  }
}
