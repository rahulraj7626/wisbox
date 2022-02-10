import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApiPost {
  Future getLogin(String email, String password) async {
    var url = Uri.https(
      'wisbox.herokuapp.com',
      'api/user/login',
    );
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );
    print(response.statusCode);
    return jsonDecode(response.body);
  }
}
