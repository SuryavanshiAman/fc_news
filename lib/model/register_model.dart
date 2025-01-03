
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Data {
  dynamic id;
  dynamic userName;
  dynamic number;


  Data(
      {
        this.id,
        this.userName,
        this.number,

      });

  Data.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userName = map['userName'];
    number = map['number'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    print("Aman$userName,$number");
    data['id'] = id;
    data['userName'] = userName;
    data['number'] = number;
    return data;
  }
}

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  static Database? _database;

  DBHelper._internal();

  // Get the database instance
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB();
      return _database!;
    }
  }

  // Initialize the database
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, number TEXT)',
      );
    }, version: 1);
  }

  // Insert a user
  Future<void> insertUser(Data data) async {
    final db = await database;
    await db.insert(
      'users',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get a user by username
  Future<Data?> getUserByUsername(String number) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'number = ?',
      whereArgs: [number],
    );
    if (maps.isNotEmpty) {
      return Data.fromMap(maps.first);
    } else {
      return null;
    }
  }
  Future<int> getUserCount() async {
    final db = await database;
    // Execute a query that counts the number of rows in the 'users' table
    var result = await db.rawQuery('SELECT COUNT(*) FROM users');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }
}