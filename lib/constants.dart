import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff2d2f41);

const LinearGradient kClockColor = LinearGradient(colors: [
  Color(0xffee0979),
  Color(0xffff6a00),
]);

const LinearGradient kAlarmColor = LinearGradient(colors: [
  Color(0xff8360c3),
  Color(0xff2ebf91),
]);

const LinearGradient kTimerColor = LinearGradient(colors: [
  Color(0xffF2994A),
  Color(0xffF2C94C),
]);

const LinearGradient kStopwatchColor = LinearGradient(colors: [
  Color(0xff654ea3),
  Color(0xffeaafc8),
]);

class GradientText extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GradientText({
    required this.text,
    required this.gradient,
  });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 40, color: Colors.white),
      ),
    );
  }
}
