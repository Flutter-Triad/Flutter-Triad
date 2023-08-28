
import 'package:flutter/material.dart';

Widget willPopScope( {required Widget child, WillPopCallback? onWillPop}){
  return WillPopScope(
    onWillPop: onWillPop ?? () async => false,
    child: child,
  );
}