import 'dart:convert';
import 'package:flutter_mandiriapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://ea20-182-1-177-113.ap.ngrok.io/mandiri/";

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
