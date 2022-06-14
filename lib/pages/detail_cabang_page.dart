import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/home_cubit.dart';
import 'package:flutter_mandiriapp/pages/buyer_page.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/pages/product_page.dart';
import 'package:flutter_mandiriapp/pages/supplier_page.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';
import 'package:flutter_mandiriapp/widgets/custom_icon_bottom_navbar.dart';

class DetailCabangPage extends StatelessWidget {
  const DetailCabangPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    Widget kunjunganSection() {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                CustomCardSektor(
                  title: "Kandika Prima P",
                  kunjungan: 4,
                  canDelete: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => InputKunjunganPage(
                              isEdit: true,
                            )),
                      ),
                    );
                  },
                ),
                CustomCardSektor(
                  title: "PIC Perusahaan",
                  kunjungan: 3,
                  canDelete: true,
                  onTap: () {},
                ),
                CustomCardSektor(
                  title: "PIC Perusahaan",
                  kunjungan: 5,
                  canDelete: true,
                  onTap: () {},
                ),
                CustomCardSektor(
                  title: "PIC Perusahaan",
                  kunjungan: 6,
                  canDelete: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return kunjunganSection();
        case 1:
          return ProductPage();
        case 2:
          return SupplierPage();
        case 3:
          return BuyerPage();
        default:
          return kunjunganSection();
      }
    }

    Widget bottomNavSection() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 70,
          color: blueMain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomIconBottomNavbar(
                imageUrl: "assets/icon_user.png",
                label: "Kunjungan",
                index: 0,
              ),
              CustomIconBottomNavbar(
                imageUrl: "assets/icon_package.png",
                label: "Produk",
                index: 1,
              ),
              CustomIconBottomNavbar(
                imageUrl: "assets/icon_truck.png",
                label: "Supplier",
                index: 2,
              ),
              CustomIconBottomNavbar(
                imageUrl: "assets/icon_shopping.png",
                label: "Buyer",
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          backgroundColor: blueMain,
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 30,
              color: yellowMain,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "input-kunjungan-page");
          },
        ),
      ),
      body: BlocBuilder<HomeCubit, int>(
        builder: (context, index) {
          return Stack(
            children: [
              buildContent(index),
              bottomNavSection(),
            ],
          );
        },
      ),
    );
  }
}
