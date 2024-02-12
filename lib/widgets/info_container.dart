import 'package:flutter/material.dart';
import 'package:swift_buy/theme/fonts.dart';

class InfoContainer extends StatelessWidget {
  final String label;
  final String content;
  const InfoContainer({required this.label,required this.content,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: titleStyle,),
          const SizedBox(height: 6,),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(content,style: subTitle,),
          )
        ],
      ),
    );
  }
}
