import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/detail_cabang_page.dart';
import 'package:flutter_mandiriapp/pages/detail_kunjungan_page.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
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
                Text(
                  "18",
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
