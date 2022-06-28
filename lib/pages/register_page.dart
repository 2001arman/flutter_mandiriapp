import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/widgets/custom_button.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerNIP = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerNamaKaryawan = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Register Page",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                    title: "NIP", hint: "", controller: controllerNIP),
                CustomTextField(
                  title: "Password",
                  hint: "",
                  controller: controllerPassword,
                ),
                CustomTextField(
                    title: "Nama Karyawawan",
                    hint: "",
                    controller: controllerNamaKaryawan),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "DAFTAR",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: blueMain,
                        content: Text("Berhasil Mendaftarkan Akun")));
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
