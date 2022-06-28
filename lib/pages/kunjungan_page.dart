import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/detail_kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';
import 'package:flutter_mandiriapp/widgets/custom_detail_card.dart';

import '../constans.dart';

class KunjunganPage extends StatelessWidget {
  const KunjunganPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    TabBar myTabs = const TabBar(
      tabs: [
        Tab(text: "Nasabah"),
        Tab(text: "Detail"),
      ],
    );

    Widget cabangViewSection() {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            BlocBuilder<KelapaCubit, KelapaState>(
              builder: (context, state) {
                if (state is KelapaLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TambangSuccess) {
                  return ColumnBuilder(
                      itemBuilder: ((context, index) => CustomCardSektor(
                          title:
                              state.tambang.contentTambang[index].namaNasabah!,
                          kunjungan:
                              "Total Kunjungan: ${state.tambang.contentTambang[index].totalKunjungan}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => DetailKunjunganPage(
                                      content:
                                          state.tambang.contentTambang[index],
                                    )),
                              ),
                            );
                          })),
                      itemCount: state.tambang.contentTambang.length);
                } else if (state is KelapaFailed) {
                  return Text(state.error);
                }
                return const Text("Data kosong");
              },
            ),
          ],
        ),
      );
    }

    Widget detailSection() {
      return Column(
        children: const [
          CustomDetailCard(jumlah: "2", title: "Total Kunjungan"),
          CustomDetailCard(jumlah: "1", title: "Total Nasabah"),
          CustomDetailCard(jumlah: "1", title: "Total Produk Holding"),
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
              fontSize: 42,
              color: yellowMain,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "input-cabang-page");
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
