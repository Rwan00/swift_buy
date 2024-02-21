import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/methods/methods.dart';
import 'package:swift_buy/theme/fonts.dart';

import '../models/address_model.dart';
import '../screens/places_details.dart';
import '../theme/body_theme.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({required this.places, super.key});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No Places Added Yet!",
          style: titleStyle,
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "Your Address",
            style: titleStyle,
          ),
          subtitle: Text(
            places[index].location.address,
            style: subTitle,
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.arrow_back_ios,
              color: primaryDeepPurple,
            ),
          ),
          onTap: () {
            animatedNavigateTo(
                context: context,
                widget: PlaceDetailScreen(place: places[index]),
                direction: PageTransitionType.leftToRight,
                curve: Curves.bounceOut);
          },
        );
      },
    );
  }
}
