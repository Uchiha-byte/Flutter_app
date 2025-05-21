import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('nikah_min_sunnati.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        gender TEXT,
        dateOfBirth TEXT,
        onBehalf TEXT
      )
    ''');
  }

  // Insert user
  Future<int> insertUser(UserModel user, String password) async {
    final db = await database;
    return await db.insert('users', {
      'email': user.email,
      'password': password, // In a real app, you should hash the password
      'firstName': user.firstName,
      'lastName': user.lastName,
      'gender': user.gender,
      'dateOfBirth': user.dateOfBirth?.toIso8601String(),
      'onBehalf': user.onBehalf,
    });
  }

  // Get user by email and password
  Future<UserModel?> getUserByEmailAndPassword(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isEmpty) return null;

    return UserModel(
      uid: maps.first['id'].toString(),
      email: maps.first['email'],
      firstName: maps.first['firstName'],
      lastName: maps.first['lastName'],
      gender: maps.first['gender'],
      dateOfBirth: maps.first['dateOfBirth'] != null
          ? DateTime.parse(maps.first['dateOfBirth'])
          : null,
      onBehalf: maps.first['onBehalf'],
    );
  }

  // Get user by ID
  Future<UserModel?> getUserById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;

    return UserModel(
      uid: maps.first['id'].toString(),
      email: maps.first['email'],
      firstName: maps.first['firstName'],
      lastName: maps.first['lastName'],
      gender: maps.first['gender'],
      dateOfBirth: maps.first['dateOfBirth'] != null
          ? DateTime.parse(maps.first['dateOfBirth'])
          : null,
      onBehalf: maps.first['onBehalf'],
    );
  }

  // Update user
  Future<int> updateUser(UserModel user) async {
    final db = await database;
    return await db.update(
      'users',
      {
        'firstName': user.firstName,
        'lastName': user.lastName,
        'gender': user.gender,
        'dateOfBirth': user.dateOfBirth?.toIso8601String(),
        'onBehalf': user.onBehalf,
      },
      where: 'id = ?',
      whereArgs: [user.uid],
    );
  }

  // Update password
  Future<int> updatePassword(String userId, String newPassword) async {
    final db = await database;
    return await db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
} 