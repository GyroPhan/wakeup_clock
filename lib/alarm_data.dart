import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String decription;
  bool isActive;

  AlarmInfo({
    required this.alarmDateTime,
    required this.decription,
    required this.isActive,
  });
}

List<AlarmInfo> alarms = [
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 1)),
    decription: 'Office',
    isActive: false,
  ),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      decription: 'Sport',
      isActive: false),
];
