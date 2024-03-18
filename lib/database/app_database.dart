
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:getmoney/database/person.dart';
import 'package:getmoney/database/person_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

const DATABASE_NAME = "money_database.db";

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}