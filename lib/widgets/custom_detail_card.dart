import 'package:flutter/cupertino.dart';
import 'package:flutter_mandiriapp/constans.dart';

class CustomDetailCard extends StatelessWidget {
  const CustomDetailCard({Key? key, required this.jumlah, required this.title})
      : super(key: key);

  final String jumlah, title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            jumlah,
            style: const TextStyle(
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
              title,
              style: TextStyle(
                fontSize: 20,
                color: yellowMain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
