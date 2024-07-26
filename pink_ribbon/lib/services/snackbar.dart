import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// showSnackBar(BuildContext context, String text) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//     ),
//   );
// }



void showToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

