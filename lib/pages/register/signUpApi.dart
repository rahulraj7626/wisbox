import 'dart:convert';

import 'package:http/http.dart' as http;

class SignUpForm {
  Future getSignUp(name, phoneNo, email, password, bool userType) async {
    var type = 'USER';
    if (userType == true) {
      type = 'VENDOR';
    }
    var url = Uri.https(
      'wisbox.herokuapp.com',
      '/api/user/register',
    );
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "name": name,
          "email": email,
          "password": password,
          "userType": type,
          "phone": phoneNo
        },
      ),
    );

    print(response.statusCode);

    return (response);
  }
}
