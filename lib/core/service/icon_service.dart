import 'package:flutter/material.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'dart:io' show Platform;
import '../resources/manager_colors.dart';
import '../resources/manager_icons.dart';

class IconService {
  final Map<IconData, IconData> icons = {
    ManagerIcons.arrow_back_android: ManagerIcons.arrow_back_ios,
  };

  IconData? getPlatformIcon(IconData icon) {
    if (Platform.isIOS) {
      if (icons.containsKey(icon)) {
        return icons[icon];
      } else if (icons.containsValue(icon)) {
        return icon;
      }
    } else {
      if (icons.containsKey(icon)) {
        return icon;
      } else if (icons.containsValue(icon)) {
        return icons.entries.firstWhere((entry) => entry.value == icon).key;
      }
    }
    return icon;
  }

  Icon getIcon({required IconData icon, Color? color, double? iconSize}) {
    return Icon(
      getPlatformIcon(icon),
      color: color ?? ManagerColors.white,
      size: iconSize ?? ManagerIconSize.s20,
    );
  }
}