import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //here, write the data and ui.
  List<int> numbers = [];
  void onClick() {
    setState(() {
      //setState() makes build method to run again.
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Click Count',
                    style: TextStyle(fontSize: 30),
                  ),
                  for (var n in numbers) Text('$n'),
                  IconButton(
                    onPressed: onClick, //here goes the name of function
                    icon: const Icon(
                      size: 40,
                      Icons.add_box_rounded,
                    ),
                  ),
                ],
              ),
            )));
  }
}
