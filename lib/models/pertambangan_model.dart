// To parse this JSON data, do
//
//     final pertambanganModel = pertambanganModelFromJson(jsonString);

import 'dart:convert';

PertambanganModel pertambanganModelFromJson(String str) => PertambanganModel.fromJson(json.decode(str));

String pertambanganModelToJson(PertambanganModel data) => json.encode(data.toJson());

class PertambanganModel {
    PertambanganModel({
        required this.value,
        required this.status,
        required this.msg,
        required this.contentTambang,
    });

    String value;
    String status;
    String msg;
    List<ContentTambang> contentTambang;

    factory PertambanganModel.fromJson(Map<String, dynamic> json) => PertambanganModel(
        value: json["value"],
        status: json["status"],
        msg: json["msg"],
        contentTambang: List<ContentTambang>.from(json["content_tambang"].map((x) => ContentTambang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "status": status,
        "msg": msg,
        "content_tambang": List<dynamic>.from(contentTambang.map((x) => x.toJson())),
    };
}

class ContentTambang {
    ContentTambang({
        this.idPertambangan,
        this.idNasabah,
        this.totalNasabah,
        this.totalKunjungan,
        this.totalProdukHolding,
        this.totalLivin,
        this.totalAksa,
        this.totalTabungan,
        this.idSektor,
        this.namaNasabah,
        this.totalKunjunganNasabah,
        this.picPerusahaan,
        this.namaPengunjung,
        this.tanggalKunjungan,
        this.produkHolding,
        this.potensiPerusahaan,
        this.tujuanKunjungan,
        this.hasilKunjungan,
        this.fotoKunjungan,
    });

    String? idPertambangan;
    String? idNasabah;
    String? totalNasabah;
    String? totalKunjungan;
    String? totalProdukHolding;
    String? totalLivin;
    String? totalAksa;
    String? totalTabungan;
    String? idSektor;
    String? namaNasabah;
    String? totalKunjunganNasabah;
    String? picPerusahaan;
    String? namaPengunjung;
    String? tanggalKunjungan;
    String? produkHolding;
    String? potensiPerusahaan;
    String? tujuanKunjungan;
    String? hasilKunjungan;
    String? fotoKunjungan;

    factory ContentTambang.fromJson(Map<String, dynamic> json) => ContentTambang(
        idPertambangan: json["id_pertambangan"],
        idNasabah: json["id_nasabah"],
        totalNasabah: json["total_nasabah"],
        totalKunjungan: json["total_kunjungan"],
        totalProdukHolding: json["total_produk_holding"],
        totalLivin: json["total_livin"],
        totalAksa: json["total_aksa"],
        totalTabungan: json["total_tabungan"],
        idSektor: json["id_sektor"],
        namaNasabah: json["nama_nasabah"],
        totalKunjunganNasabah: json["total_kunjungan_nasabah"],
        picPerusahaan: json["pic_perusahaan"],
        namaPengunjung: json["nama_pengunjung"],
        tanggalKunjungan: json["tanggal_kunjungan"],
        produkHolding: json["produk_holding"],
        potensiPerusahaan: json["potensi_perusahaan"],
        tujuanKunjungan: json["tujuan_kunjungan"],
        hasilKunjungan: json["hasil_kunjungan"],
        fotoKunjungan: json["foto_kunjungan"],
    );

    Map<String, dynamic> toJson() => {
        "id_pertambangan": idPertambangan,
        "id_nasabah": idNasabah,
        "total_nasabah": totalNasabah,
        "total_kunjungan": totalKunjungan,
        "total_produk_holding": totalProdukHolding,
        "total_livin": totalLivin,
        "total_aksa": totalAksa,
        "total_tabungan": totalTabungan,
        "id_sektor": idSektor,
        "nama_nasabah": namaNasabah,
        "total_kunjungan_nasabah": totalKunjunganNasabah,
        "pic_perusahaan": picPerusahaan,
        "nama_pengunjung": namaPengunjung,
        "tanggal_kunjungan": tanggalKunjungan,
        "produk_holding": produkHolding,
        "potensi_perusahaan": potensiPerusahaan,
        "tujuan_kunjungan": tujuanKunjungan,
        "hasil_kunjungan": hasilKunjungan,
        "foto_kunjungan": fotoKunjungan,
    };
}
