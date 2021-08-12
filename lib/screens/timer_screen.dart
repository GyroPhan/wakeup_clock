import 'package:flutter/material.dart';

import '../constants.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientText(text: 'Timer', gradient: kTimerColor),
        ],
      ),
    );
  }
}
