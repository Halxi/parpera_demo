import 'package:flutter/material.dart';

class WidgetHelper {
  static displaySnackBar(BuildContext context, String msg, bool isError,
      {SnackBarAction? snackBarAction, int timer = 2, Color warningColor = Colors.red}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: timer),
        action: snackBarAction,
        backgroundColor: isError ? warningColor : Colors.green,
        content: Text(msg, textScaleFactor: 1.0)));
  }

  static showNormalDialog(BuildContext context,
      {String title = "Launch", required Widget content, VoidCallback? onBackAction}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center, textScaleFactor: 1.0),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                content,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Center(child: Text('Ok', style: TextStyle(fontSize: 16), textScaleFactor: 1.0)),
              onPressed: onBackAction ?? () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }

  static Widget imageLoadingBuilder(ImageChunkEvent? loadingProgress, Widget child) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
