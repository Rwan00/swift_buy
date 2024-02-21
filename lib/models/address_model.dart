
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String id;
  final PlaceLocation location;

  Place({
    String? id,
    required this.location,
  }) : id = id?? uuid.v4();
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}