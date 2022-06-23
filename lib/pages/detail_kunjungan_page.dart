import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/models/pertambangan_model.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

import '../constans.dart';

class DetailKunjunganPage extends StatelessWidget {
  const DetailKunjunganPage({Key? key, required this.content})
      : super(key: key);
  final ContentTambang content;
  @override
  Widget build(BuildContext context) {
    TabBar myTabs = const TabBar(
      tabs: [
        Tab(text: "Kunjungan"),
        Tab(text: "Produk Holding"),
      ],
    );

    Widget cabangViewSection() {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            CustomCardSektor(
              title: content.namaPengunjung!,
              kunjungan: "${content.tanggalKunjungan}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const InputKunjunganPage(
                      isEdit: true,
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    Widget detailSection() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blueMain),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: blueMain,
                  alignment: Alignment.center,
                  child: Text(
                    "Total Kunjungan",
                    style: TextStyle(
                      fontSize: 20,
                      color: yellowMain,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 160,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blueMain),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: blueMain,
                  alignment: Alignment.center,
                  child: Text(
                    "Total Kunjungan",
                    style: TextStyle(
                      fontSize: 20,
                      color: yellowMain,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 160,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blueMain),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: blueMain,
                  alignment: Alignment.center,
                  child: Text(
                    "Total Kunjungan",
                    style: TextStyle(
                      fontSize: 20,
                      color: yellowMain,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueMain,
          bottom: myTabs,
          title: Text(
            content.namaNasabah.toString(),
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
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const InputKunjunganPage(
                      isEdit: true,
                    )),
                  ),
                );
          },
        ),
        body: TabBarView(
          children: [
            cabangViewSection(),
            detailSection(),
          ],
        ),
      ),
    );
  }
}