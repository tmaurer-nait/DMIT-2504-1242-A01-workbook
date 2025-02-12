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

  // TODO: Create dog function
  // TODO: get dogs function
  // TODO: update dog function
  // TODO: delete dog function
}
