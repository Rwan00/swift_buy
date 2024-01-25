import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_buy_/theme/body_theme.dart';

import '../theme/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 50,
              decoration:  const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white,

              ),
              child:  const Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.menu_open_outlined,color: primaryDeepPurple,size: 32,),
        ),
      ),
    );
  }
}
