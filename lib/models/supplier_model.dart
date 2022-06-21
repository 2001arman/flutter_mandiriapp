// To parse this JSON data, do
//
//     final supplierModel = supplierModelFromJson(jsonString);

import 'dart:convert';

SupplierModel supplierModelFromJson(String str) => SupplierModel.fromJson(json.decode(str));

String supplierModelToJson(SupplierModel data) => json.encode(data.toJson());

class SupplierModel {
    SupplierModel({
        required this.value,
        required this.status,
        required this.msg,
        required this.contentSupplier,
    });

    String value;
    String status;
    String msg;
    List<ContentSupplier> contentSupplier;

    factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        contentSupplier: List<ContentSupplier>.from(json["content_supplier"].map((x) => ContentSupplier.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "content_supplier": List<dynamic>.from(contentSupplier.map((x) => x.toJson())),
    };
}

class ContentSupplier {
    ContentSupplier({
        this.idSupplierBuyer,
        this.namaSupplierBuyer,
        this.kategori,
        this.tanggal,
        this.idSektor,
    });

    String? idSupplierBuyer;
    String? namaSupplierBuyer;
    String? kategori;
    String? tanggal;
    String? idSektor;

    factory ContentSupplier.fromJson(Map<String, dynamic> json) => ContentSupplier(
        idSupplierBuyer: json["id_supplier_buyer"],
        namaSupplierBuyer: json["nama_supplier_buyer"],
        kategori: json["kategori"],
        tanggal: json["tanggal"],
        idSektor: json["id_sektor"],
    );

    Map<String, dynamic> toJson() => {
        "id_supplier_buyer": idSupplierBuyer,
        "nama_supplier_buyer": namaSupplierBuyer,
        "kategori": kategori,
        "tanggal": tanggal,
        "id_sektor": idSektor,
    };
}
