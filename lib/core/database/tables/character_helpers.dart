

import 'package:sqflite/sqflite.dart';
import '../local_database.dart';

class DatabaseHelper {
  Future<int> insertCharacter(Map<String, dynamic> data) async {
    final db = await AppDatabase.database;
    return await db.insert(
      'characters',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllCharacters() async {
    final db = await AppDatabase.database;
    return await db.query('characters');
  }

  Future<Map<String, dynamic>?> getCharacterById(int id) async {
    final db = await AppDatabase.database;
    final result = await db.query(
      'characters',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<int> updateCharacter(int id, Map<String, dynamic> data) async {
    final db = await AppDatabase.database;
    return await db.update(
      'characters',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCharacter(int id) async {
    final db = await AppDatabase.database;
    return await db.delete(
      'characters',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}