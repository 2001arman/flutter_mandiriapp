import 'package:flutter/material.dart';
import 'package:flutter_mandiriapp/widgets/custom_button.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerUsername = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: double.infinity,
            ),
            SizedBox(height: 40),
            CustomTextField(
              title: "Username",
              controller: controllerUsername,
              hint: "Masukkan username anda",
            ),
            CustomTextField(
              title: "Password",
              controller: controllerPassword,
              hint: "Masukkan password anda",
              isSecure: true,
            ),
            SizedBox(height: 40),
            CustomButton(
              text: "LOGIN",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'main-page', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
