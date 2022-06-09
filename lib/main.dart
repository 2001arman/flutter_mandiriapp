import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/pages/input_kunjungan_page.dart';
import 'package:flutter_mandiriapp/pages/login_page.dart';
import 'package:flutter_mandiriapp/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => LoginPage(),
      'main-page': (context) => MainPage(),
      'input-kunjungan-page': (context) => InputKunjunganPage(),
    });
  }
}
