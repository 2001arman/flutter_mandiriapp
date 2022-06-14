import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomIconBottomNavbar extends StatelessWidget {
  const CustomIconBottomNavbar(
      {Key? key,
      required this.label,
      required this.imageUrl,
      required this.index})
      : super(key: key);

  final String label, imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().setPage(index);
      },
      child: Container(
        margin: context.watch<HomeCubit>().state == index
            ? EdgeInsets.only(top: 5)
            : EdgeInsets.symmetric(vertical: 9),
        child: Column(
          children: [
            Image(
              image: AssetImage(imageUrl),
              color: context.watch<HomeCubit>().state == index
                  ? yellowMain
                  : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                color: context.watch<HomeCubit>().state == index
                    ? yellowMain
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
