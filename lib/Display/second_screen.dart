import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Display/display_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Name: ${provider.state.name}'),
            Text('Age: ${provider.state.age}'),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.increaseAge();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
