import 'dart:convert';
import 'package:flutter_mandiriapp/models/admin_model.dart';
import 'package:flutter_mandiriapp/models/kelapa_model.dart';
import 'package:flutter_mandiriapp/models/pertambangan_model.dart';
import 'package:flutter_mandiriapp/models/produk_model.dart';
import 'package:flutter_mandiriapp/models/supplier_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://7a5f-103-31-207-25.ap.ngrok.io/mandiri/";

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

  Future<KelapaModel> getDataKelapa() async{
    try {
      var url = Uri.parse(endpoint + "get-kelapa-sawit.php");
      var response = await http.post(url);
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      KelapaModel kelapa = KelapaModel.fromJson(parsed);
      return kelapa;
    } catch (e) {
      rethrow;
    }
  }

  Future<PertambanganModel> getDataPertambangan() async{
    try {
      var url = Uri.parse(endpoint + "get-pertambangan.php");
      var response = await http.post(url);
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      PertambanganModel tambang = PertambanganModel.fromJson(parsed);
      return tambang;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProdukModel> getDataProduct() async{
    try {
      var url = Uri.parse(endpoint + "get-produk.php");
      var response = await http.post(url);
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      ProdukModel produk = ProdukModel.fromJson(parsed);
      return produk;
    } catch (e) {
      rethrow;
    }
  }

  Future<SupplierModel> getDataSupplier() async{
    try {
      var url = Uri.parse(endpoint + "get-supplier.php");
      var response = await http.post(url);
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      SupplierModel supplier = SupplierModel.fromJson(parsed);
      return supplier;
    } catch (e) {
      rethrow;
    }
  }
}
