import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

/// Helper to access the to the local database
class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(join(dbPath, 'items.db'), version: 1,
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE items (id INTEGER PRIMARY KEY, name TEXT, price REAL, path TEXT)');
    });
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
    final sqlDb = await DBHelper.database();
    return sqlDb.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<int> delete(String table, int id) async {
    final sqlDb = await DBHelper.database();
    return sqlDb.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getAll(String table) async {
    final sqlDb = await DBHelper.database();
    return sqlDb.query(table);
  }
}
