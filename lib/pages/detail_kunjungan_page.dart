import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/models/pertambangan_model.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';
import 'package:flutter_mandiriapp/widgets/custom_detail_card.dart';

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

    Widget kunjunganViewSection() {
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

    Widget produkHoldingSection() {
      return Column(
        children: const [
          CustomDetailCard(
            jumlah: "2",
            title: "Livin",
          ),
          CustomDetailCard(
            jumlah: "0",
            title: "Aksa",
          ),
          CustomDetailCard(
            jumlah: "2",
            title: "Tabungan",
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
              fontSize: 42,
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
            kunjunganViewSection(),
            produkHoldingSection(),
          ],
        ),
      ),
    );
  }
}
