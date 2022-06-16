import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/widgets/custom_no_image_card.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          Column(
            children: [
              CustomNoImageCard(
                title: "Kandika",
                detail: "22 Januari 2022",
                onTap: () {},
                canDelete: true,
              ),
              CustomNoImageCard(
                title: "Aksa",
                detail: "22 Januari 2022",
                onTap: () {},
                canDelete: true,
              ),
              CustomNoImageCard(
                title: "Livin",
                detail: "22 Januari 2022",
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
