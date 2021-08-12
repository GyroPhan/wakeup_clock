import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wakeup_clock/screens/alarm_screen.dart';
import 'package:wakeup_clock/screens/clock_screen.dart';
import 'package:wakeup_clock/clock_view.dart';
import 'package:wakeup_clock/constants.dart';
import 'package:wakeup_clock/screens/stopwatch_screen.dart';
import 'package:wakeup_clock/screens/timer_screen.dart';

import '../drawer_cus.dart';

class HomeScreen extends StatefulWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        title: 'Clock',
        iconSource: 'assets/clock_icon.png',
        color: Colors.white),
    MenuItem(
        title: 'Alarm',
        iconSource: 'assets/alarm_icon.png',
        color: Colors.white),
    MenuItem(
        title: 'Timer',
        iconSource: 'assets/timer_icon.png',
        color: Colors.white),
    MenuItem(
        title: 'Stopwatch',
        iconSource: 'assets/stopwatch_icon.png',
        color: Colors.white),
  ];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    _buildBody() {
      switch (selectedMenu) {
        case 0:
          return ClockScreen();
        case 1:
          return AlarmScreen();
        case 2:
          return TimerScreen();
        case 3:
          return StopwatchScreen();
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          MenuCus(
              menuItems: widget.menuItems,
              animDuration: Duration(milliseconds: 300),
              onPressed: (index) {
                setState(() {
                  selectedMenu = index;
                  print(selectedMenu);
                });
              }),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Container(child: _buildBody()),
        ],
      ),
    );
  }
}
