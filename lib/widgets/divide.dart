import 'package:flutter/material.dart';
import 'package:swift_buy_/theme/body_theme.dart';

class Divide extends StatelessWidget {
  const Divide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 3,
        width: 390,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                primaryPurple,
                primaryDeepPurple,
                lightPurple,

              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.mirror),
        ),
      ),
    );
  }
}