import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../Anasayfa/ui/Gorev.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String gorevTable = 'gorev_table';
  String colId = 'id';
  String colTitle = 'title';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    //factory!
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Gorev.db';

    // Open/create the database at a given path
    var GorevDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return GorevDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $gorevTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colPriority INTEGER, $colDate TEXT)');
  }

  // Fetch Operation: Get all gorev objects from database
  Future<List<Map<String, dynamic>>> getGorevMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $gorevTable order by $colPriority ASC');
    var result = await db.query(gorevTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a Gorev object to database
  Future<int> insertGorev(Gorev gorev) async {
    Database db = await this.database;
    var result = await db.insert(gorevTable, gorev.toMap());
    return result;
  }

  // Update Operation: Update a Gorev object and save it to database
  Future<int> updateGorev(Gorev gorev) async {
    var db = await this.database;
    var result = await db.update(gorevTable, gorev.toMap(),
        where: '$colId = ?', whereArgs: [gorev.id]);
    return result;
  }

  // Delete Operation: Delete a Gorev object from database
  Future<int> deleteGorev(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $gorevTable WHERE $colId = $id');
    return result;
  }

  // Get number of Gorev objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $gorevTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Gorev List' [ List<Gorev> ]
  Future<List<Gorev>> getGorevList() async {
    var gorevMapList = await getGorevMapList(); // Get 'Map List' from database
    int count =
        gorevMapList.length; // Count the number of map entries in db table

    List<Gorev> gorevList = List<Gorev>();
    // For loop to create a 'Gorev List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      gorevList.add(Gorev.fromMapObject(gorevMapList[i]));
    }

    return gorevList;
  }
}
