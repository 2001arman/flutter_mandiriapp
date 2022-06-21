import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/cubit/auth_cubit.dart';
import 'package:flutter_mandiriapp/cubit/home_cubit.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/pages/input_cabang_page.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/pages/login_page.dart';
import 'package:flutter_mandiriapp/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => KelapaCubit(),
        ),
      ],
      child: MaterialApp(routes: {
        '/': (context) => LoginPage(),
        'main-page': (context) => MainPage(),
        'input-kunjungan-page': (context) => InputKunjunganPage(),
        'input-cabang-page': (context) => InputCabangPage(),
      }),
    );
  }
}
