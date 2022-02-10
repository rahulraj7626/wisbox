import 'package:flutter/material.dart';

MaterialBanner materialBanner(BuildContext context, err_msg) {
  return MaterialBanner(
    // ignore: prefer_const_constructors
    leading: Icon(Icons.error, color: Colors.red),
    content: Text(
      '$err_msg',
      // ignore: prefer_const_constructors
      style: TextStyle(color: Colors.white, fontSize: 15),
    ),
    backgroundColor: Colors.black,
    actions: [
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
    ],
  );
}
