import 'dart:convert';
import 'package:flutter_mandiriapp/models/admin_model.dart';
import 'package:flutter_mandiriapp/models/input_model.dart';
import 'package:flutter_mandiriapp/models/kelapa_model.dart';
import 'package:flutter_mandiriapp/models/pertambangan_model.dart';
import 'package:flutter_mandiriapp/models/produk_model.dart';
import 'package:flutter_mandiriapp/models/supplier_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://f1ec-114-125-205-68.ap.ngrok.io/mandiri/";

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

  Future<KelapaModel> getDataKelapa() async {
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

  Future<PertambanganModel> getDataPertambangan() async {
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

  Future<ProdukModel> getDataProduct() async {
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

  Future<SupplierModel> getDataSupplier() async {
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

  Future<InputModel> inputKelapa({
    required String kota,
    required String cif,
    required String namaKoperasi,
    required String kebunInti,
    required String luasLahan,
    required String jumlahAnggota,
    required String kodeCabang,
    required String namaCabang,
    required String checkBMRI,
    required String checkDebitur,
    required String area,
  }) async {
    try {
      var url = Uri.parse(endpoint + 'input-kelapa.php');
      var response = await http.post(url, body: {
        'kota': kota,
        'cif': cif,
        'namaKoperasi': namaKoperasi,
        'kebunInti': kebunInti,
        'luasLahan': luasLahan,
        'jumlahAnggota': jumlahAnggota,
        'kodeCabang': kodeCabang,
        'namaCabang': namaCabang,
        'checkBMRI': checkBMRI,
        'checkDebitur': checkDebitur,
        'area': area,
      });
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      InputModel input = InputModel.fromJson(parsed);
      return input;
    } catch (e) {
      rethrow;
    }
  }

  Future<InputModel> inputProduk({
    required String namaProduk,
    required String namaNasabah,
  }) async {
    try {
      var url = Uri.parse(endpoint + 'input-produk.php');
      var response = await http.post(url, body: {
        'nama_produk': namaProduk,
        'nama_nasabah': namaNasabah,
      });
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      InputModel input = InputModel.fromJson(parsed);
      return input;
    } catch (e) {
      rethrow;
    }
  }

  Future<InputModel> inputSupplier({
    required String namaSupplier,
    required String tanggalSupplier,
    required String kategori,
  }) async {
    try {
      var url = Uri.parse(endpoint + 'input-supplier.php');
      var response = await http.post(url, body: {
        'nama_supplier_buyer': namaSupplier,
        'tanggal': tanggalSupplier,
        'kategori': kategori,
      });
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      InputModel input = InputModel.fromJson(parsed);
      return input;
    } catch (e) {
      rethrow;
    }
  }
}
