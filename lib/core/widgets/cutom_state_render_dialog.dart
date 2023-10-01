import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'main_button.dart';

customStateRenderDialog({
  required BuildContext context,
  required StateRenderType stateRenderType,
  required String message,
  required String title,
  void Function()? onPressed,
  Widget? child,
  String? buttonTitle,
}) {
  return dialogRender(
    context: context,
    stateRenderType: stateRenderType,
    message: message,
    title: title,
    child: child ??
        mainButton(
          onPressed: onPressed.onNull(),
          buttonName: buttonTitle.onNull(),
        ),
  );
}
