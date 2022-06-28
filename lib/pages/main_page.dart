import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/input_file_page.dart';
import 'package:flutter_mandiriapp/pages/kelapa_page.dart';
import 'package:flutter_mandiriapp/pages/kunjungan_page.dart';
import 'package:flutter_mandiriapp/pages/produk_page.dart';
import 'package:flutter_mandiriapp/pages/supplier_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Input Excel",
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
              builder: ((context) => InputFilePage()),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Mandiri App",
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
              title: "Kelapa Sawit(Koperasi)",
              kunjungan: "Total Nasabah: 2",
              isSektor: true,
              onTap: () {
                context.read<KelapaCubit>().getKelapa();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => KelapaPage()),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Pertambangan",
              kunjungan: "Total Nasabah: 2",
              isSektor: true,
              onTap: () {
                context.read<KelapaCubit>().getTambang();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const KunjunganPage(
                          title: "Pertambangan",
                        )),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Produk",
              kunjungan: "Total Nasabah: 2",
              isSektor: true,
              onTap: () {
                context.read<KelapaCubit>().getProduk();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProdukPage()),
                  ),
                );
              },
            ),
            CustomCardSektor(
              title: "Supplier & Buyer",
              kunjungan: "Total Nasabah: 2",
              isSektor: true,
              onTap: () {
                context.read<KelapaCubit>().getSupplier();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SupplierPage()),
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
