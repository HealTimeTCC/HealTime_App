import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarError {
  static snackBarError({required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        closeIconColor: Colors.white,
        showCloseIcon: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Text(msg),
      ),
    );
  }
}
