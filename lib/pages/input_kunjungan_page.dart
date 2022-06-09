import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/widgets/custom_date_picker.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';

class InputKunjunganPage extends StatelessWidget {
  const InputKunjunganPage({Key? key, this.isEdit = false}) : super(key: key);

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          isEdit ? "Detail Kunjungan" : "Input Kunjungan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueMain,
        child: isEdit
            ? Icon(Icons.edit)
            : Text(
                "+",
                style: TextStyle(
                  fontSize: 30,
                  color: yellowMain,
                ),
              ),
        onPressed: () {
          Navigator.pushNamed(context, "input-kunjungan-page");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  title: "P.I.C Perusahaan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomDatePicker(
                  title: "Tanggal Kunjungan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "P.I.C Perusahaan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "Produk Holding",
                  maxLines: 3,
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "Potensi Perusahaan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "Tujuan Kunjungan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "Hasil Kunjungan",
                  hint: "",
                  controller: textEditingController,
                ),
                CustomTextField(
                  title: "Profile Perusahaan",
                  hint: "",
                  controller: textEditingController,
                ),
                SizedBox(height: 10),
                Text("Foto Kunjungan"),
                isEdit
                    ? Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/DetailFoto.png"),
                          ),
                        ),
                      )
                    : Container(
                        width: 77,
                        height: 77,
                        margin: EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/add_picture.png"),
                          ),
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
