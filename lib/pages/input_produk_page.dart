import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/auth_cubit.dart';
import 'package:flutter_mandiriapp/cubit/input_cubit.dart';
import 'package:flutter_mandiriapp/widgets/custom_button.dart';

import '../constans.dart';

class InputProdukPage extends StatefulWidget {
  const InputProdukPage({Key? key}) : super(key: key);

  @override
  State<InputProdukPage> createState() => _InputProdukPageState();
}

class _InputProdukPageState extends State<InputProdukPage> {
  String valueProduk = 'Livin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Tambah Produk",
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
                const SizedBox(height: 5),
                const Text("Nama Produk"),
                DropdownButton<String>(
                  value: valueProduk,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueProduk = newValue!;
                    });
                  },
                  items: <String>['Livin', 'Aksa', 'Tabungan']
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
                              context.read<InputCubit>().inputProduk(
                                  namaProduk: valueProduk,
                                  namaNasabah: state.user.content!.namaAdmin!);
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
