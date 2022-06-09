import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

class DetailCabangPage extends StatelessWidget {
  const DetailCabangPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          title,
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
        onPressed: () {
          Navigator.pushNamed(context, "input-kunjungan-page");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            CustomCardSektor(
              title: "Kandika Prima P",
              kunjungan: 4,
              canDelete: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => InputKunjunganPage(
                          isEdit: true,
                        )),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "PIC Perusahaan",
              kunjungan: 3,
              canDelete: true,
              onTap: () {},
            ),
            CustomCardSektor(
              title: "PIC Perusahaan",
              kunjungan: 5,
              canDelete: true,
              onTap: () {},
            ),
            CustomCardSektor(
              title: "PIC Perusahaan",
              kunjungan: 6,
              canDelete: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
