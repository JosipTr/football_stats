import 'dart:async';
import 'package:floor/floor.dart';
import 'package:football_stats/data/datasources/local_data_source/DAOs/player_dao.dart';
import 'package:football_stats/data/models/player_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Player])
abstract class AppDatabase extends FloorDatabase {
  PlayerDao get playerDao;
}