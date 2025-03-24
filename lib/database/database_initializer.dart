import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseInitializer {
  static Database? _database;
  static final DatabaseInitializer instance = DatabaseInitializer._privateConstructor();

  DatabaseInitializer._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'casmusal.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        String sql = await _loadSQLFile('lib/database/migrations/schema.sql');
        List<String> queries = sql.split(';');
        for (String query in queries) {
          if (query.trim().isNotEmpty) {
            await db.execute(query);
          }
        }
      },
    );
  }

  Future<String> _loadSQLFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
