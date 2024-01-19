import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalPomodoros = 0;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        timer.cancel();
        totalSeconds = twentyFiveMinutes;
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
      });
    } else {
      setState(() {});
      totalSeconds = totalSeconds - 1;
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      //the function periodic runs should have argument Timer
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
    print(isRunning);
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
    print(isRunning);
  }

  void onRestartPressed() {
    setState(() {
      timer.cancel();
      totalSeconds = twentyFiveMinutes;
      onStartPressed();
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    IconButton(
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline),
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      iconSize: 200,
                      color: Theme.of(context).cardColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: onRestartPressed,
                      child: Container(
                        decoration: BoxDecoration(
                          color: totalSeconds == twentyFiveMinutes
                              ? Theme.of(context).cardColor.withOpacity(0.5)
                              : Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Restart',
                            style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodors',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '$totalPomodoros',
                            style: TextStyle(
                              fontSize: 58,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
