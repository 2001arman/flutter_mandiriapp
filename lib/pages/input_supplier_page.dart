import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/auth_cubit.dart';
import 'package:flutter_mandiriapp/cubit/input_cubit.dart';
import 'package:flutter_mandiriapp/widgets/custom_button.dart';
import 'package:flutter_mandiriapp/widgets/custom_date_picker.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../constans.dart';

class InputSupplierPage extends StatefulWidget {
  const InputSupplierPage({Key? key}) : super(key: key);

  @override
  State<InputSupplierPage> createState() => _InputSupplierPageState();
}

class _InputSupplierPageState extends State<InputSupplierPage> {
  String valueKategori = 'supplier';
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Tambah Supplier",
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
                  title: "Nama",
                  hint: "",
                  controller: controllerNama,
                ),
                CustomDatePicker(
                  title: "Tanggal Kunjungan",
                  hint: "",
                  controller: controllerTanggal,
                  controllerValue: controllerValue,
                ),
                const SizedBox(height: 5),
                const Text("Kategori"),
                DropdownButton<String>(
                  value: valueKategori,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueKategori = newValue!;
                    });
                  },
                  items: <String>['supplier', 'buyer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                    return BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return CustomButton(
                            text: "Tambah Data",
                            onTap: () {
                              var date = DateTime.parse(controllerValue.text);
                              String tanggal =
                                  DateFormat("yyyy-MM-d", "id_ID").format(date);
                              context.read<InputCubit>().inputSupplier(
                                    namaSupplier: controllerNama.text,
                                    tanggalSupplier: tanggal,
                                    kategori: valueKategori,
                                  );
                            },
                          );
                        }
                        return CustomButton(text: "Tambah Data", onTap: () {});
                      },
                    );
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
