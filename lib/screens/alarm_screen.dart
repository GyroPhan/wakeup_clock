import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wakeup_clock/constants.dart';

import '../alarm_data.dart';
import '../main.dart';

// ignore: use_key_in_widget_constructors
class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double heightOfListview = height - 110;
    double width = MediaQuery.of(context).size.width;
    double widthOfListview = width - 140;
    return SafeArea(
      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GradientText(text: 'Alarm', gradient: kAlarmColor),
              Container(
                height: heightOfListview,
                width: widthOfListview,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: alarms.length,
                        itemBuilder: (context, index) {
                          _buildColor(index) {
                            int colorIndex = index % 4;
                            switch (colorIndex) {
                              case 0:
                                return kClockColor;
                              case 1:
                                return kAlarmColor;
                              case 2:
                                return kTimerColor;
                              case 3:
                                return kStopwatchColor;
                            }
                          }

                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  gradient: _buildColor(index),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white54.withOpacity(0.4),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      offset: Offset(4, 4),
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.label,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Office',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Switch(
                                        value: true,
                                        onChanged: (bool value) {},
                                        activeColor: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Mon-Fri',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '07:00 AM',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DottedBorder(
                        color: Colors.white,
                        strokeWidth: 2,
                        dashPattern: [8, 4],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(24),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Color(0xff5b5f8a),
                              borderRadius: BorderRadius.circular(24)),
                          child: FlatButton(
                            onPressed: () {
                              print('tap tap');
                              scheduleAlarm();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/add_alarm.png',
                                  color: Colors.blueAccent,
                                  width: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Add Alarm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'logo_icon.png',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('assets/logo_icon.png'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(0, 'Office', 'Good morning!',
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
