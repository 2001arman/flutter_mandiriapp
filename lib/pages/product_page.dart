import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/widgets/custom_no_image_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          Column(
            children: [
              CustomNoImageCard(
                title: "Livin",
                detail: "Total produk: 67",
                onTap: () {},
                canDelete: true,
              ),
              CustomNoImageCard(
                title: "Aksa",
                detail: "Total produk: 45",
                onTap: () {},
                canDelete: true,
              ),
              CustomNoImageCard(
                title: "Livin",
                detail: "Total produk: 67",
                onTap: () {},
                canDelete: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
