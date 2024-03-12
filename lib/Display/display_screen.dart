import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Display/display_provider.dart';
import 'package:provider_test/Display/second_screen.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _ageFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        appBar: AppBar(
          title: const Text('Provider Test'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SecondScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Enter Your Name'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _controller,
                    focusNode: _nameFocus,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Enter Your Age'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _ageController,
                    focusNode: _ageFocus,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.changeName(_controller.text);
                        provider.getAge(_ageController.text);
                        _controller.clear();
                        _ageController.clear();
                        _ageFocus.unfocus();
                        _nameFocus.unfocus();
                      },
                      child: const Text('Confirm')),
                ],
              ),
            ),
          ),
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
