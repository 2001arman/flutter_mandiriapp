import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';

class CustomCardSektor extends StatelessWidget {
  const CustomCardSektor(
      {Key? key,
      required this.title,
      required this.kunjungan,
      required this.onTap,
      this.canDelete = false,
      this.isSektor = false,
      this.haveImage = true})
      : super(key: key);

  final String title;
  final String kunjungan;
  final VoidCallback onTap;
  final bool canDelete, isSektor, haveImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            haveImage
                ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: isSektor
                            ? AssetImage("assets/mountain.png")
                            : AssetImage("assets/user_circle.png"),
                      ),
                    ),
                  )
                : SizedBox(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(kunjungan),
              ],
            ),
            canDelete
                ? Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redMain,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Hapus",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
