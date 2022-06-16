// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.value,
    required this.status,
    required this.msg,
    required this.content,
  });

  String value;
  String status;
  String msg;
  Content content;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "content": content.toJson(),
      };
}

class Content {
  Content({
    required this.nip,
    required this.nama,
    required this.idCabang,
    required this.level,
  });

  String nip;
  String nama;
  String idCabang;
  String level;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        nip: json["nip"],
        nama: json["nama"],
        idCabang: json["id_cabang"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "id_cabang": idCabang,
        "level": level,
      };
}
