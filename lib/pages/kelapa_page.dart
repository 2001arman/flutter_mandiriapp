import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/input_kelapa_page.dart';
import 'package:flutter_mandiriapp/pages/kelapa_detail.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

class KelapaPage extends StatelessWidget {
  const KelapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Kelapa Sawit(Koperasi)",
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
              builder: ((context) => InputKelapaPage()),
            ),
          );
        },
      ),
      body: BlocBuilder<KelapaCubit, KelapaState>(
        builder: (context, state) {
          if (state is KelapaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is KelapaSuccess) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: ColumnBuilder(
                itemCount: state.kelapa.content!.length,
                itemBuilder: ((context, index) {
                  return CustomCardSektor(
                    title: state.kelapa.content![index].namaKoperasi!,
                    kunjungan:
                        "Luas Lahan ${state.kelapa.content![index].luasLahan}, 5 Ha",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KelapaDetail(
                            kelapaContent: state.kelapa.content![index],
                          ),
                        ),
                      );
                    },
                    haveImage: false,
                  );
                }),
              ),
            );
          } else if (state is KelapaFailed) {
            return Center(
              child: Text(state.error),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ColumnBuilder(
              itemCount: 2,
              itemBuilder: ((context, index) {
                return CustomCardSektor(
                  title: "Koperasi Samarinda",
                  kunjungan: "Luas Lahan 12, 5 Ha",
                  onTap: () {},
                  haveImage: false,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
