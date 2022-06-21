// To parse this JSON data, do
//
//     final kelapaModel = kelapaModelFromJson(jsonString);

import 'dart:convert';

KelapaModel kelapaModelFromJson(String str) => KelapaModel.fromJson(json.decode(str));

String kelapaModelToJson(KelapaModel data) => json.encode(data.toJson());

class KelapaModel {
    KelapaModel({
        required this.value,
        required this.status,
        required this.msg,
        this.content,
    });

    String value;
    String status;
    String msg;
    List<Content>? content;

    factory KelapaModel.fromJson(Map<String, dynamic> json) => KelapaModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
    };
}

class Content {
    Content({
        this.idKelapaSawit,
        this.kabupatenKota,
        this.cif,
        this.namaKoperasi,
        this.kebunInti,
        this.luasLahan,
        this.jumlahAnggota,
        this.idCabang,
        this.checkBmri,
        this.checkDebitur,
        this.area,
    });

    String? idKelapaSawit;
    String? kabupatenKota;
    String? cif;
    String? namaKoperasi;
    String? kebunInti;
    String? luasLahan;
    String? jumlahAnggota;
    String? idCabang;
    String? checkBmri;
    String? checkDebitur;
    String? area;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        idKelapaSawit: json["id_kelapa_sawit"],
        kabupatenKota: json["kabupaten_kota"],
        cif: json["cif"],
        namaKoperasi: json["nama_koperasi"],
        kebunInti: json["kebun_inti"],
        luasLahan: json["luas_lahan"],
        jumlahAnggota: json["jumlah_anggota"],
        idCabang: json["id_cabang"],
        checkBmri: json["check_bmri"],
        checkDebitur: json["check_debitur"],
        area: json["area"],
    );

    Map<String, dynamic> toJson() => {
        "id_kelapa_sawit": idKelapaSawit,
        "kabupaten_kota": kabupatenKota,
        "cif": cif,
        "nama_koperasi": namaKoperasi,
        "kebun_inti": kebunInti,
        "luas_lahan": luasLahan,
        "jumlah_anggota": jumlahAnggota,
        "id_cabang": idCabang,
        "check_bmri": checkBmri,
        "check_debitur": checkDebitur,
        "area": area,
    };
}
