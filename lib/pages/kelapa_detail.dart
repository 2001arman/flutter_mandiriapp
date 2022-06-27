import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/models/kelapa_model.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_detail.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';

class KelapaDetail extends StatefulWidget {
  const KelapaDetail({Key? key, required this.kelapaContent}) : super(key: key);

  final Content kelapaContent;

  @override
  State<KelapaDetail> createState() => _KelapaDetailState();
}

class _KelapaDetailState extends State<KelapaDetail> {
  TextEditingController controllerKota = TextEditingController();
  TextEditingController controllerCIF = TextEditingController();
  TextEditingController controllerKoperasi = TextEditingController();
  TextEditingController controllerKebun = TextEditingController();
  TextEditingController controllerLahan = TextEditingController();
  TextEditingController controllerAnggota = TextEditingController();
  TextEditingController controllerKodeCabang = TextEditingController();
  TextEditingController controllerNamaCabang = TextEditingController();
  TextEditingController controllerArea = TextEditingController();
  String valueBMRI = 'bmri';
  String valueDebiture = 'debitur';

  @override
  void initState() {
    super.initState();
    controllerKota.text = widget.kelapaContent.kabupatenKota!;
    controllerCIF.text = widget.kelapaContent.cif!;
    controllerKoperasi.text = widget.kelapaContent.namaKoperasi!;
    controllerKebun.text = widget.kelapaContent.kebunInti!;
    controllerLahan.text = widget.kelapaContent.luasLahan!;
    controllerAnggota.text = widget.kelapaContent.jumlahAnggota!;
    controllerKodeCabang.text = widget.kelapaContent.idCabang!;
    controllerNamaCabang.text = widget.kelapaContent.namaKoperasi!;
    controllerArea.text = widget.kelapaContent.area!;
    valueBMRI = widget.kelapaContent.checkBmri!;
    valueDebiture = widget.kelapaContent.checkDebitur!;
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueMain,
        child: Text(
          "+",
          style: TextStyle(
            fontSize: 30,
            color: yellowMain,
          ),
        ),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  title: "Kabuptaen/Kota",
                  hint: "",
                  controller: controllerKota,
                ),
                CustomTextField(
                  title: "CIF",
                  hint: "",
                  controller: controllerCIF,
                ),
                CustomTextField(
                  title: "Nama Koperasi",
                  hint: "",
                  controller: controllerKoperasi,
                ),
                CustomTextField(
                  title: "Kebun Inti",
                  hint: "",
                  controller: controllerKebun,
                ),
                CustomTextField(
                  title: "Luas Lahan(Ha)",
                  hint: "",
                  controller: controllerLahan,
                ),
                CustomTextField(
                  title: "Jumlah Anggota",
                  hint: "",
                  controller: controllerAnggota,
                ),
                CustomTextField(
                  title: "Kode Cabang",
                  hint: "",
                  controller: controllerKodeCabang,
                ),
                CustomTextField(
                  title: "Nama Cabang",
                  hint: "",
                  controller: controllerNamaCabang,
                ),
                const SizedBox(height: 5),
                const Text("Check BMRI"),
                DropdownButton<String>(
                  value: valueBMRI,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueBMRI = newValue!;
                    });
                  },
                  items: <String>['bmri', 'nonbmri']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 5),
                const Text("Check Debitur"),
                DropdownButton<String>(
                  value: valueDebiture,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueDebiture = newValue!;
                    });
                  },
                  items: <String>['debitur', 'nondebitur']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                CustomTextField(
                  title: "Area",
                  hint: "",
                  controller: controllerArea,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
