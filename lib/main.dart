import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Counter/home_provider.dart';
import 'package:provider_test/Counter/home_screen.dart';
import 'package:provider_test/Display/display_provider.dart';
import 'package:provider_test/Display/display_screen.dart';
import 'package:provider_test/Shopping_cart/manager/shopping_provider.dart';
import 'package:provider_test/Shopping_cart/presentation/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider()), 
      ChangeNotifierProvider(create: (context) => DisplayProvider()), 
      ChangeNotifierProvider(create: (context) => ShoppingProvider()), 
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

