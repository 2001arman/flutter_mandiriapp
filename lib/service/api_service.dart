import 'dart:convert';
import 'package:flutter_mandiriapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://489b-103-31-207-25.ap.ngrok.io/mandiri/";

  Future<UserModel> login(String nip, String password) async {
    try {
      var url = Uri.parse(endpoint + 'login.php');
      var response =
          await http.post(url, body: {'nip': nip, 'password': password});
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(parsed);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
