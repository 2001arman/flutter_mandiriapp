import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/models/kelapa_model.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_detail.dart';

class KelapaDetail extends StatelessWidget {
  const KelapaDetail({Key? key, required this.kelapaContent}) : super(key: key);

  final Content kelapaContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Detail Koperasi",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextDetail(
                title: "Kabupaten/Kota",
                content: kelapaContent.kabupatenKota.toString()),
            CustomTextDetail(
                title: "CIF", content: kelapaContent.cif.toString()),
            CustomTextDetail(
                title: "Nama Koperasi",
                content: kelapaContent.namaKoperasi.toString()),
            CustomTextDetail(
                title: "Kebun Inti",
                content: kelapaContent.kebunInti.toString()),
            CustomTextDetail(
                title: "Luas Lahan",
                content: kelapaContent.luasLahan.toString()),
            CustomTextDetail(
                title: "Jumlah Anggota",
                content: kelapaContent.jumlahAnggota.toString()),
            CustomTextDetail(
                title: "Kode Cabang",
                content: kelapaContent.idCabang.toString()),
            CustomTextDetail(
                title: "Nama Cabang",
                content: kelapaContent.namaKoperasi.toString()),
            CustomTextDetail(
                title: "Check BMRI",
                content: kelapaContent.checkBmri.toString()),
            CustomTextDetail(
                title: "Check Debitur",
                content: kelapaContent.checkDebitur.toString()),
            CustomTextDetail(
                title: "Area", content: kelapaContent.area.toString()),
          ],
        ),
      ),
    );
  }
}
