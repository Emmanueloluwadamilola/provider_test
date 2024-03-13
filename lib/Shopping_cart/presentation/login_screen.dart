import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Shopping_cart/manager/shopping_provider.dart';
import 'package:provider_test/Shopping_cart/presentation/product_screen.dart';
import 'package:provider_test/Shopping_cart/presentation/splash_screen.dart';
import 'package:provider_test/Shopping_cart/views/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  // @override
  // void initState() {
  //   Timer(const Duration(seconds: 4), () {
  //     Navigator.of(context)
  //         .pop(MaterialPageRoute(builder: (context) => const SplashScreen()));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopify_outlined,
                color: MyColors.primary,
                size: 80,
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 231, 231),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: _controller,
                    // focusNode: FocusNode(),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        iconColor: MyColors.primary,
                        hintText: 'Name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  provider.login(_controller.text);
                  Navigator.pushAndRemoveUntil(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => const ProductScreen())),
                      (route) => false);
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: MyColors.white),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
