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
  bool showTitle = true;
  //here, write the data and ui.
  List<int> numbers = [];
  void onToggle() {
    setState(() {
      //setState() makes build method to run again.
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.red),
          ),
        ),
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  showTitle ? const MyLargeTitle() : const Text('nothing'),
                  IconButton(
                    onPressed: onToggle,
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ],
              ),
            )));
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    //when the Stateful Widget become
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    //when the Stateful Widget gets killed
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
