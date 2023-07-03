import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
//text form field focus node
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currrent,
    FocusNode nextFocus,
  ) {
    currrent.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //fluttertoast message show
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

// Flushbar error show message
  static void anotherflushBarErrorMessage(
      String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        titleColor: Colors.white,
        // title: "",
        duration: const Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.easeIn,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(20),
      )..show(context),
    );
  }

// show message snackbar
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
}
