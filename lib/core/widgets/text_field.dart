import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';

Widget textField({
  required String hintText,
  bool? obSecure,
  required TextEditingController controller,
  validator,
  Widget? suffixIcon,
  Widget? prefixIcon,
  void Function()? onTap,
  onChange,
  TextInputType? textInputType,
  FocusNode? focusNode,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obSecure.onNull(),
    keyboardType: textInputType,
    onTap: onTap,
    focusNode: focusNode,
    onChanged: onChange ?? (val) {},
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h10,
        horizontal: ManagerWidth.w10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      filled: true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: ManagerColors.white,
      hintText: hintText,
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.greyLight,
      ),
    ),
  );
}
