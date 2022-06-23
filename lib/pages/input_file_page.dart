import 'package:flutter/material.dart';

import '../constans.dart';

class InputFilePage extends StatelessWidget {
  const InputFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Masukkan Excel",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Masukkan Excel",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/AddPictureBig.png",),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
