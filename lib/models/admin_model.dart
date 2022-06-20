// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.value,
    this.status,
    this.msg,
    this.role,
    this.content,
  });

  String? value;
  String? status;
  String? msg;
  String? role;
  Content? content;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        role: json["role"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "role": role,
        "content": content!.toJson(),
      };
}

class Content {
  Content({
    this.idAdmin,
    this.nipAdmin,
    this.namaAdmin,
  });

  String? idAdmin;
  String? nipAdmin;
  String? namaAdmin;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        idAdmin: json["id_admin"],
        nipAdmin: json["nip_admin"],
        namaAdmin: json["nama_admin"],
      );

  Map<String, dynamic> toJson() => {
        "id_admin": idAdmin,
        "nip_admin": nipAdmin,
        "nama_admin": namaAdmin,
      };
}
