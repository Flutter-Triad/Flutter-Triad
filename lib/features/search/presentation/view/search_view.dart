import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/widgets/text_field.dart';
import 'package:flutter_triad/features/search/presentation/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppSearchController());
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        title: Text(
          ManagerStrings.search,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s20, color: ManagerColors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16, vertical: ManagerHeight.h10),
        child: Column(
          children: [
            textField(
              hintText: ManagerStrings.hintSearch,
              controller: controller.searchController,
              validator: (value) =>
                  controller.validator.validateFullName(value),
              textInputType: TextInputType.text,
              suffixIcon: Icon(
                Icons.search_rounded,
                size: ManagerRadius.r30,
                color: ManagerColors.searchColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}