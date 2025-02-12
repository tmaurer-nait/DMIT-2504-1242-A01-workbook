import 'package:local_sql_example/models/dog.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DogDbManager {
  // Private constructor for a singleton
  const DogDbManager._();

  // singleton instance
  static const DogDbManager instance = DogDbManager._();

  static const _dbName = 'dogs.db';
  static const _dbVersion = 1;

  static Database? _database;

  // Create a getter for the database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _connectToDB();
    return _database!;
  }

  Future<Database> _connectToDB() async {
    final dbPath = await getDatabasesPath();

    // join the database path to the db file
    final path = join(dbPath, _dbName);

    // Open up the database, creating it if necessary
    final db = openDatabase(
      path,
      onCreate: (database, version) {
        database.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      version: _dbVersion,
    );
    return db;
  }

  Future<void> closeDB() async {
    final db = await database;
    db.close();
  }

  // get dogs function
  Future<List<Dog>> getDogs() async {
    final db = await database;

    final dogMaps = await db.query('dogs');

    // Option 1: For loop
    // List<Dog> output = [];
    // for (final dogMap in dogMaps) {
    //   output.add(Dog.fromMap(dogMap));
    // }
    // return output;

    // Option 2: List.generate
    // return List.generate(
    //   dogMaps.length,
    //   (i) => Dog.fromMap(dogMaps[i]),
    // );

    // Option 3: List comprehension
    return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];
  }

  // Create dog function
  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // delete dog function
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  // TODO: update dog function
}
