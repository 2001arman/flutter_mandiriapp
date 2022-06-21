// To parse this JSON data, do
//
//     final produkModel = produkModelFromJson(jsonString);

import 'dart:convert';

ProdukModel produkModelFromJson(String str) => ProdukModel.fromJson(json.decode(str));

String produkModelToJson(ProdukModel data) => json.encode(data.toJson());

class ProdukModel {
    ProdukModel({
        required this.value,
        required this.status,
        required this.msg,
        required this.contentProduk,
    });

    String value;
    String status;
    String msg;
    List<ContentProduk> contentProduk;

    factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        contentProduk: List<ContentProduk>.from(json["content_produk"].map((x) => ContentProduk.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "content_produk": List<dynamic>.from(contentProduk.map((x) => x.toJson())),
    };
}

class ContentProduk {
    ContentProduk({
        this.idProduk,
        this.namaProduk,
        this.namaNasabah,
        this.idSektor,
    });

    String? idProduk;
    String? namaProduk;
    String? namaNasabah;
    String? idSektor;

    factory ContentProduk.fromJson(Map<String, dynamic> json) => ContentProduk(
        idProduk: json["id_produk"],
        namaProduk: json["nama_produk"],
        namaNasabah: json["nama_nasabah"],
        idSektor: json["id_sektor"],
    );

    Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "nama_produk": namaProduk,
        "nama_nasabah": namaNasabah,
        "id_sektor": idSektor,
    };
}
