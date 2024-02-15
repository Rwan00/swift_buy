import 'package:flutter/material.dart';

import '../widgets/input_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            InputField(
              hint: 'What Are Looking For..',
              widget: Icon(Icons.search_outlined),
            )
          ],
        ),
      ),
    );
  }
}
