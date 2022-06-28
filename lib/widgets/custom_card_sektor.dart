import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/input_cubit.dart';
import 'package:flutter_mandiriapp/pages/kelapa_page.dart';
import 'package:flutter_mandiriapp/pages/main_page.dart';

class CustomCardSektor extends StatelessWidget {
  const CustomCardSektor(
      {Key? key,
      required this.title,
      required this.kunjungan,
      required this.onTap,
      this.onDelete,
      this.canDelete = false,
      this.isSektor = false,
      this.haveImage = true})
      : super(key: key);

  final String title;
  final String kunjungan;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
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
                        GestureDetector(
                          onTap: onDelete,
                          child: BlocConsumer<InputCubit, InputState>(
                            listener: (context, state) {
                              if (state is InputSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: blueMain,
                                    content: Text(state.input.msg),
                                  ),
                                );
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) => MainPage())));
                              } else if (state is InputFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: blueMain,
                                    content: Text(state.error),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is InputLoading) {
                                return CircularProgressIndicator();
                              }
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: redMain,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Hapus",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
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
