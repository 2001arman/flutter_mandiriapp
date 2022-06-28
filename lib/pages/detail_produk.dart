import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/input_produk_page.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

import '../constans.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({Key? key, required this.nama}) : super(key: key);

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueMain,
          title: Text(nama),
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
                builder: ((context) => InputProdukPage()),
              ),
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              BlocBuilder<KelapaCubit, KelapaState>(
                builder: (context, state) {
                  if (state is KelapaLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductSuccess) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: ColumnBuilder(
                        itemCount: state.produk.contentProduk.length,
                        itemBuilder: ((context, index) {
                          return CustomCardSektor(
                            title:
                                state.produk.contentProduk[index].namaProduk!,
                            kunjungan:
                                "${state.produk.contentProduk[index].namaNasabah}",
                            onTap: () {},
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
            ],
          ),
        ));
  }
}
