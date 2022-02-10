import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future pickImage() async {
  try {
    var pickedImage = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) return;

    return File(pickedImage.path);
  } catch (e) {
    print(e);
  }
}
