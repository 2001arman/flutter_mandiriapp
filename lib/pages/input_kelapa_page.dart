import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/input_cubit.dart';
import 'package:flutter_mandiriapp/widgets/custom_button.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';

import '../constans.dart';

class InputKelapaPage extends StatefulWidget {
  const InputKelapaPage({Key? key}) : super(key: key);

  @override
  State<InputKelapaPage> createState() => _InputKelapaPageState();
}

class _InputKelapaPageState extends State<InputKelapaPage> {
  String valueBMRI = 'bmri';
  String valueDebiture = 'debitur';

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerKota = TextEditingController();
    TextEditingController controllerCIF = TextEditingController();
    TextEditingController controllerKoperasi = TextEditingController();
    TextEditingController controllerKebun = TextEditingController();
    TextEditingController controllerLahan = TextEditingController();
    TextEditingController controllerAnggota = TextEditingController();
    TextEditingController controllerKodeCabang = TextEditingController();
    TextEditingController controllerNamaCabang = TextEditingController();
    TextEditingController controllerArea = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Tambah Koperasi",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                const SizedBox(height: 20),
                BlocConsumer<InputCubit, InputState>(
                  listener: (context, state) {
                    if (state is InputSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: blueMain,
                          content: Text(state.input.msg),
                        ),
                      );
                      Navigator.pop(context);
                    } else if (state is InputFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: blueMain,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is InputLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                        text: "Tambah Data",
                        onTap: () {
                          context.read<InputCubit>().inputKelapa(
                                kota: controllerKota.text,
                                cif: controllerCIF.text,
                                namaKoperasi: controllerKoperasi.text,
                                kebunInti: controllerKebun.text,
                                luasLahan: controllerLahan.text,
                                jumlahAnggota: controllerAnggota.text,
                                kodeCabang: controllerKodeCabang.text,
                                namaCabang: controllerNamaCabang.text,
                                checkBMRI: valueBMRI,
                                checkDebitur: valueDebiture,
                                area: controllerArea.text,
                              );
                        });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
