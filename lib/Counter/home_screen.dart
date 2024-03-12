import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Counter/home_provider.dart';
import 'package:provider_test/Counter/second_csreen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeProvider _provider = HomeProvider();
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _provider.state.num++;
    });
    context.read<HomeProvider>().changeValue(_provider.state.num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Provider - Read & Watch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_provider.state.num}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SecondScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
