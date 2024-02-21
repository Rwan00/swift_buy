

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import '../models/address_model.dart';


Future<sql.Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, "place.db"),
    onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE user_places(id TEXT PRIMARY KEY,lat REAL,lng REAL,address TEXT)");
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final sql.Database db = await _getDatabase();
    final data = await db.query("user_places");

    final places = data
        .map(
          (row) => Place(
            id: row["id"] as String,
            location: PlaceLocation(
                latitude: row["lat"] as double,
                longitude: row["lng"] as double,
                address: row["address"] as String),
          ),
        )
        .toList();

    state = places;
  }

  void addPlace(PlaceLocation location) async {
    
    final newPlace = Place( location: location);

    final db = await _getDatabase();

    db.insert("user_places", {
      "id": newPlace.id,
      "lat": newPlace.location.latitude,
      "lng": newPlace.location.longitude,
      "address": newPlace.location.address,
    });
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
