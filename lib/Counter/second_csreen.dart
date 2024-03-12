import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Counter/home_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Number =  ${context.watch<HomeProvider>().state.num.toString()}',
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
