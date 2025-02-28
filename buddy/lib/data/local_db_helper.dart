import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Initialize the database
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database1.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            torque REAL NOT NULL
          )
        ''');
      },
    );
  }

  // Get the database instance
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Insert an item into the database
  static Future<int> insertItem(String name, double torque) async {
    final db = await getDatabase();
    return await db.insert(
      'items',
      {'name': name, 'torque': torque},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all items from the database
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await getDatabase();
    return await db.query('items');
  }

  static Future<void> deleteItem(int id) async {
    final db = await getDatabase();
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
  static Future<void> deleteAllItems() async {
    final db = await getDatabase();
    await db.delete('items');
  }
}