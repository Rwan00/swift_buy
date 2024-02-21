import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_buy/theme/fonts.dart';

import '../provider/user_address.dart';
import '../widgets/places_list.dart';


class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;
  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlace = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title:  Text("Your Places",style: heading,),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context,snapshot) =>
            snapshot.connectionState == ConnectionState.waiting?
             const Center(
              child: CircularProgressIndicator(),
            ):
             PlacesList(
              places: userPlace,
            ),
          
        ),
      ),
    );
  }
}
