import 'dart:async';
import 'package:p_app_v2/models/property_model.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  final tableName = 'fav_properties';
  final databaseName = 'canberry_database.db';

  Future<Database> initDataBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final Future<Database> database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), databaseName),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, description TEXT, propertyMeta TEXT, imageUrls TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }

  //   "id": id,
  // "title": title,
  // "description": description,
  // "propertyMeta": jsonEncode(propertyMeta.toMap()),
  // "imageUrls": imageUrls.toString().replaceAll("[", "").replaceAll("]", ""),
  // };

  Future<void> insertProperty(PropertyModel property) async {
    Database db = await initDataBase();
    print("Property Start");
    print(property.toMap());
    print("Property End");
    var _res = await db.insert(
      tableName,
      property.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // print(_res);
  }

  Future<List<PropertyModel>> loadFavProperties() async {
    // Get a reference to the database.
    final Database db = await initDataBase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    var _res = List.generate(maps.length, (i) {
      print(maps[i]);
      return PropertyModel.fromMap(maps[i]);
    });
    return _res;
  }

  Future<void> updateFavProperty(PropertyModel property) async {
    // Get a reference to the database.
    final db = await initDataBase();

    // Update the given Dog.
    var _res = await db.update(
      tableName,
      property.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [property.id],
    );
    print(_res);
  }

  Future<void> deleteFavProperty(int id) async {
    // Get a reference to the database.
    final db = await initDataBase();

    // Remove the Dog from the database.
    var _res = await db.delete(
      tableName,
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    print(_res);
  }
}
