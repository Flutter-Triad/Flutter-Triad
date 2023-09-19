import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/cache/cache.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/features/home/domain/model/images_model.dart';
import 'package:flutter_triad/features/home/domain/usecase/images_usecase.dart';
import 'package:flutter_triad/features/main/presentation/controller/main_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;
  NetworkInfo networkInfo = instance<NetworkInfo>();

  final ImagesUseCase _useCase = instance<ImagesUseCase>();

  CacheData cacheData = CacheData();
  ImagesModel imagesModel = ImagesModel(images: []);

  void change(int index) {
    current = index;
    update();
  }

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  ImageProvider<Object> imageProvider(
      {required String courseAvatar, String? defaultImage}) {
    if (isURLValid(courseAvatar)) {
      return CachedNetworkImageProvider(courseAvatar);
    }

    return AssetImage(
      defaultImage ?? ManagerAssets.course,
    );
  }

  Widget image({required String courseAvatar, String? defaultImage}) {
    if (isURLValid(courseAvatar)) {
      return Image.network(
        courseAvatar,
        fit: BoxFit.fill,
        width: ManagerWidth.w300,
        height: ManagerHeight.h205,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.course,
      fit: BoxFit.fill,
      width: ManagerWidth.w300,
      height: ManagerHeight.h160,
    );
  }

  void navigateToAllCategories() {
    changeMainCurrentIndex(1);
  }



  void selectCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  performRefresh() async {
    if (await networkInfo.isConnected) {
      await home();
    } else {
      BuildContext context = Get.context!;
      dialogRender(
        context: context,
        message: ManagerStrings.NO_INTERNT_CONNECTION,
        title: '',
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  Future<void> home() async {
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
      (l) {
        errorMessage = l.message.toString();
        isLoading = 2;
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Navigator.of(context).pop();
          },
        );
      },
      (r) {
        imagesModel = r;
        isLoading = 1;
      },
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }
}
