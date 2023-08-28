
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastNotification{
  void playToast({required BuildContext context , required String message }){
    ToastContext().init(context);
    Toast.show(message);
  }
}