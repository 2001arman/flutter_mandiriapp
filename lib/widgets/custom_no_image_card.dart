import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';

class CustomNoImageCard extends StatelessWidget {
  const CustomNoImageCard(
      {Key? key,
      required this.title,
      required this.detail,
      required this.onTap,
      this.canDelete = false,
      this.isSektor = false})
      : super(key: key);

  final String title;
  final String detail;
  final VoidCallback onTap;
  final bool canDelete, isSektor;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(detail),
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
