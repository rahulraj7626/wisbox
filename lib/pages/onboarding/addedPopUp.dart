import 'package:flutter/material.dart';
import 'package:nexmat/widgets/app_buttons/app_primary_button.dart';

createPopup(BuildContext context,
    {required addMsg, required Function() onPressed}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Icon(Icons.check_circle, color: Colors.green),
        content: Text(
          "$addMsg",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Center(
            child: AppPrimaryButton(
              child: Text('ok'),
              onPressed: onPressed,
            ),
          )
        ],
      );
    },
  );
}
