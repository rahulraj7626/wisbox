import 'dart:convert';

import 'package:http/http.dart' as http;

class AddStoreForm {
  Future addStoreReq(
      {shopName,
      GSTid,
      country,
      dist,
      city,
      storeType,
      prodCategory,
      openingTime,
      closingTime,
      email,
      phoneNo,
      StoreImageUrl}) async {
    var url = Uri.https(
      'wisbox.herokuapp.com',
      '/api/UserData/add/store',
    );
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWRjMDUwNTNiMTMzYjJhZDhjNmEzNGEiLCJpYXQiOjE2NDI1OTQyODB9.mmKoZ5ZlHijBJES-ruV6ZQX6of4PSdB1VdOQeQN7GMY',
      },
      body: jsonEncode(
        {
          "name": shopName,
          "shopType": storeType,
          "gstid": GSTid,
          "email": email,
          "phone": phoneNo,
          "country": country,
          "city": city,
          "district": dist,
          "categoryOfproduct": prodCategory,
          "openTime": openingTime.toString(),
          "closeTime": closingTime.toString(),
          "storePhotos": [StoreImageUrl.toString()]
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    return (response);

    // print(shopName);
    // print(storeType);
    // print(GSTid);
    // print(email);
    // print(phoneNo);
    // print(country);
    // print(city);
    // print(dist);
    // print(prodCategory);
    // print(openingTime);
    // print(closingTime);
  }
}
