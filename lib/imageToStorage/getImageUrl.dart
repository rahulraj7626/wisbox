import 'package:firebase_storage/firebase_storage.dart';
import 'package:nexmat/imageToStorage/uploadImage.dart';

var fbStorage = FirebaseStorage.instance;

Future getProfilePicUrl(_email) async {
  var profPicUrl = await fbstorage
      .ref('$_email/Profile/Profile Picture.jpg')
      .getDownloadURL()
      .then((value) {
    print('Successfully Get the Profile image url:$value');
    return value;
  });
  return profPicUrl;
}

Future getStoreImageUrl(_email) async {
  var storeImageUrl = await fbStorage
      .ref('$_email/Store/Store Picture/storePic.jpg')
      .getDownloadURL()
      .then(
    (value) {
      print('Successfully Get the Store image url:$value');
      return value;
    },
  );
  return storeImageUrl;
}

Future getProdImageUrl(_email) async {
  var prodImageUrl = await fbStorage
      .ref('$_email/Store/Product Picture/prod.jpg')
      .getDownloadURL()
      .then((value) {
    print('Successfully Get the Product image url:$value');
    return value;
  });
  return prodImageUrl;
}
