import 'dart:convert';
import 'package:flutter_mandiriapp/models/admin_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://3cda-103-31-207-25.ap.ngrok.io/mandiri/";

  Future<AdminModel> login(String nip, String password) async {
    try {
      var url = Uri.parse(endpoint + 'login.php');
      var response =
          await http.post(url, body: {'nip': nip, 'password': password});
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      AdminModel user = AdminModel.fromJson(parsed);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
