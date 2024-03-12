import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider_test/Shopping_cart/presentation/splash_screen.dart';
import 'package:provider_test/Shopping_cart/views/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pop(MaterialPageRoute(builder: (context) => const SplashScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              color: MyColors.primary,
              size: 40,
            ),
            const Gap(10),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                    icon: Icon(Icons.mail_outline),
                    iconColor: MyColors.primary,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.blueGrey)),
              ),
            ),
            const Gap(10),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  iconColor: MyColors.primary,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
                obscureText: true,
              ),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: MyColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
