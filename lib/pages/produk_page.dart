import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/detail_produk.dart';
import 'package:flutter_mandiriapp/pages/input_produk_page.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';
import 'package:flutter_mandiriapp/widgets/custom_no_image_card.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueMain,
          title: Text(
            "Produk",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: yellowMain,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomNoImageCard(
                title: "Livin",
                detail: "Total Nasabah: 2",
                onTap: () {
                  context.read<KelapaCubit>().getProduk('Livin');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailProduk(
                              nama: "Livin",
                            )),
                  );
                },
              ),
              CustomNoImageCard(
                title: "Aksa",
                detail: "Total Nasabah: 2",
                onTap: () {
                  context.read<KelapaCubit>().getProduk('Aksa');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailProduk(
                              nama: "Aksa",
                            )),
                  );
                },
              ),
              CustomNoImageCard(
                title: "Tabungan",
                detail: "Total Nasabah: 2",
                onTap: () {
                  context.read<KelapaCubit>().getProduk('Tabungan');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailProduk(
                              nama: "Tabungan",
                            )),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
