import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes_util.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_styles.dart';

enum StateRenderType {
  popupLoadingState,
  popupErrorState,
  popupSuccess,
}

class StateRender extends StatelessWidget {
  StateRenderType stateRenderType;
  late String message =  ManagerStrings.loading;
  String title;
  Function? retryAction = () {};

  StateRender(
      {super.key,
      required this.stateRenderType,
      required this.message,
      this.title = '',
      this.retryAction});

  @override
  Widget build(BuildContext context) {
    return getStateWidget(context);
  }

  Widget getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.popupLoadingState:
        return getPopDialog(
          context,
          [
            getAnimatedImage(
              ManagerJson.loading,
            ),
            getMessage(message),
          ],
        );

      case StateRenderType.popupErrorState:
        return getPopDialog(
          context,
          [
            getAnimatedImage(ManagerJson.error),
            getMessage(message),
            getButton(
              ManagerStrings.ok,
              context,
              retryAction,
            ),
          ],
        );

      case StateRenderType.popupSuccess:
        return getPopDialog(
          context,
          [
            getAnimatedImage(ManagerJson.success),
            getMessage(title),
            getMessage(message),
            getButton(ManagerStrings.ok, context, retryAction),
          ],
        );

      default:
        return Container();
    }
  }

  Widget getItemsColumn(
    List<Widget> children,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget getAnimatedImage(
    String animationName,
  ) {
    return SizedBox(
      height: ManagerHeight.h100,
      width: ManagerWidth.w100,
      child: Lottie.asset(
        animationName,
      ),
    );
  }

  Widget getMessage(
    String message,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w8,
        vertical: ManagerHeight.h8
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: getRegularTextStyle(
          fontSize: ManagerFontSize.s18,
          color: ManagerColors.black,
        ),
      ),
    );
  }

  Widget getButton(String buttonTitle, BuildContext context, onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w18,
        vertical: ManagerHeight.h18
      ),
      child: SizedBox(
        width: double.infinity,
        child: mainButton(
          onPressed: onPressed,
          buttonName: ManagerStrings.ok,
        ),
      ),
    );
  }

  Widget getPopDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r14,
        ),
      ),
      elevation: 1.5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ManagerColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r14,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: getDialogContent(
          context,
          children,
        ),
      ),
    );
  }

  Widget getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

dialogRender({
  required BuildContext context,
  required String message,
  required String title,
  required StateRenderType stateRenderType,
  required retryAction,
  bool? barrierDismissible,
}) {
  showDialog(
    barrierDismissible: barrierDismissible ?? false,
    context: context,
    builder: (context) => StateRender(
      stateRenderType: stateRenderType,
      message: message,
      title: title,
      retryAction: retryAction,
    ),
  );
}
