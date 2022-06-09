import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/pages/detail_cabang_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

import '../constans.dart';

class KunjunganPage extends StatelessWidget {
  const KunjunganPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    TabBar myTabs = const TabBar(
      tabs: [
        Tab(text: "Cabang"),
        Tab(text: "Detail"),
      ],
    );

    Widget cabangViewSection() {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            CustomCardSektor(
              title: "PT. Suka Maju",
              kunjungan: 4,
              canDelete: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (((context) => DetailCabangPage(
                          title: "PT. Suka Maju",
                        ))),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "PT. Suka Makmur",
              kunjungan: 3,
              canDelete: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (((context) => DetailCabangPage(
                          title: "PT. Suka Makmur",
                        ))),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "PT. Sejahtera",
              kunjungan: 5,
              canDelete: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (((context) => DetailCabangPage(
                          title: "PT. Sejahtera",
                        ))),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "PT. Makmur",
              kunjungan: 6,
              canDelete: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (((context) => DetailCabangPage(
                          title: "PT. Makmur",
                        ))),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blueMain,
            bottom: myTabs,
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
            onPressed: () {},
          ),
          body: TabBarView(children: [
            cabangViewSection(),
            Center(
              child: Text("Detail"),
            ),
          ])),
    );
  }
}
