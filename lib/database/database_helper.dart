
import 'package:getmoney/database/app_database.dart';

class DatabaseHelper {
  AppDatabase? _database;
  static final DatabaseHelper _instance = DatabaseHelper._();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._();

  Future<AppDatabase> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<AppDatabase> _initDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder(DATABASE_NAME).build();

    return database;
  }
}
