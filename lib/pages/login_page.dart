import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/auth_cubit.dart';
import 'package:flutter_mandiriapp/pages/register_page.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: double.infinity,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              title: "NIP",
              controller: controllerUsername,
              hint: "Masukkan NIP anda",
            ),
            CustomTextField(
              title: "Password",
              controller: controllerPassword,
              hint: "Masukkan password anda",
              isSecure: true,
            ),
            const SizedBox(height: 40),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'main-page', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: blueMain,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  text: "LOGIN",
                  onTap: () {
                    context.read<AuthCubit>().signIn(
                          email: controllerUsername.text,
                          password: controllerPassword.text,
                        );
                  },
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "REGISTER",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => RegisterPage()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
