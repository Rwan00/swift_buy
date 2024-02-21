import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/methods/methods.dart';
import 'package:swift_buy/theme/fonts.dart';
import 'package:swift_buy/widgets/my_btn.dart';

import '../models/address_model.dart';
import '../provider/user_address.dart';
import '../widgets/location_input.dart';
import 'places_screen.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    PlaceLocation? selectedLocation;

    savePlace() {
      if (selectedLocation == null) {
        return;
      } else {
        ref.read(userPlacesProvider.notifier).addPlace(selectedLocation!);
        animatedNavigateTo(
            context: context,
            widget: const PlacesScreen(),
            direction: PageTransitionType.bottomToTop,
            curve: Curves.bounceOut);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Your Address:",
              style: heading.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Address",
              style: titleStyle,
            ),
            LocationInput(
              onSelectedLocation: (location) => selectedLocation = location,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                AppBtn(
                  onPressed: () => savePlace(),
                  label: "Add Place",
                ),
                Spacer(),
                AppBtn(
                    label: "Your Places",
                    onPressed: () {
                      animatedNavigateTo(
                          context: context,
                          widget: const PlacesScreen(),
                          direction: PageTransitionType.bottomToTop,
                          curve: Curves.bounceOut);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
