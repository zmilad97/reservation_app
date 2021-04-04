
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String username;
  String password;

  String url = 'http://10.0.2.2:9090/login';

  User({this.username, this.password});

  Future<http.Response> authorize() async {
    try {
      http.Response response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': '${this.username}',
            'password': '${this.password}'
          }));

      return response;
    } catch (e) {
      print('Caught Error !!! : $e');
      return null;
    }
  }
}
