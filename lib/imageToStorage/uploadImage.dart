import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

var fbstorage = FirebaseStorage.instance;

Future uploadProfilePicture(_email, File profPic) async {
  await fbstorage
      .ref('$_email/Profile/Profile Picture.jpg')
      .putFile(profPic)
      .then((p2) => print('Profile Pic Uploadded Successfully.'));
}

Future uploadStoreImage(_email, File storeImage) async {
  try {
    await fbstorage
        .ref('$_email/Store/Store Picture/storePic.jpg')
        .putFile(storeImage)
        .then((p0) => print('Store Pic Uploadded Successfully.'));
  } catch (e) {}
}

Future uploadProductImage(_email, File prodImage) async {
  try {
    await fbstorage
        .ref('$_email/Store/Product Picture/prod.jpg')
        .putFile(prodImage)
        .then((p1) => print('Product Pic Uploadded Successfully.'));
  } catch (e) {}
}
