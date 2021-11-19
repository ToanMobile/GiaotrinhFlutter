// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:lesson11/entity/person.dart';
import 'package:lesson11/entity/person_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}