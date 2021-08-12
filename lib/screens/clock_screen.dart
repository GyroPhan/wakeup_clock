import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wakeup_clock/constants.dart';

import '../clock_view.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var fomatTime = DateFormat('HH:mm').format(now);
    var fomatDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    return SafeArea(
      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(text: 'Clock', gradient: kClockColor),
                    Text(
                      fomatTime,
                      style: TextStyle(
                        fontSize: 55,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      fomatDate,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.center,
                  child: ClockView(
                    size: 250,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Timezone',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'UTC ' + offsetSign + timezoneString,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
