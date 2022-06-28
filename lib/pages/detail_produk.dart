import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/widgets/custom_card_sektor.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Livin"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCardSektor(
                    title: "Junadi",
                    kunjungan: "",
                    onTap: () {},
                    haveImage: false,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
