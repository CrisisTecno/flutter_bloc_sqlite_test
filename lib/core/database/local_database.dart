

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'tables/character_table.dart';

class AppDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDB();
    return _database!;
  }

  static Future<Database> getDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'flutter_local.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(CharacterTable.createTable());
  }
}
