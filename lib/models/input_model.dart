// To parse this JSON data, do
//
//     final inputModel = inputModelFromJson(jsonString);

import 'dart:convert';

InputModel inputModelFromJson(String str) => InputModel.fromJson(json.decode(str));

String inputModelToJson(InputModel data) => json.encode(data.toJson());

class InputModel {
    InputModel({
        required this.value,
        required this.status,
        required this.msg,
    });

    String value;
    String status;
    String msg;

    factory InputModel.fromJson(Map<String, dynamic> json) => InputModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
    };
}
