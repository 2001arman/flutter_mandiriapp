import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/pages/kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "SEKTOR",
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
          children: [
            CustomCardSektor(
              title: "Pertambangan",
              kunjungan: 12,
              isSektor: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        KunjunganPage(title: "Pertambangan")),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Port",
              kunjungan: 12,
              isSektor: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => KunjunganPage(title: "Port")),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Pertanian",
              kunjungan: 8,
              isSektor: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => KunjunganPage(title: "Pertanian")),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Pembangunan",
              kunjungan: 23,
              isSektor: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => KunjunganPage(title: "Pembangunan")),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
