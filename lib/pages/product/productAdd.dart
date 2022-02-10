import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductAddForm {
  Future getAddProduct({
    prodName,
    typeOfProd,
    brand,
    price,
    quantType,
    unitType,
    description,
    prodImage,
  }) async {
    if (quantType == 1) {
      quantType = 'Fixed';
    } else if (quantType == 2) {
      quantType = 'Variable';
    }

    var url = Uri.https(
      'wisbox.herokuapp.com',
      '/api/UserData/add/product/61f2945a98c607b8a63de7a3',
    );
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWYyODdjNjk4YzYwN2I4YTYzZGU3NGYiLCJpYXQiOjE2NDMyODQ0NDV9.dUtzbXJ9Ioczr7Lm5duP68P-LzforsmHfSHYPuPUMmc',
      },
      body: jsonEncode(
        {
          "name": prodName,
          "typeOfProduct": typeOfProd,
          "brand": brand,
          "price": price,
          "QuantityType": quantType,
          "unitType": unitType,
          "description": description,
          "productImages": [prodImage.toString()]
        },
      ),
    );
    print(response.statusCode);
    //print(response.body);
    return response;
  }
}
