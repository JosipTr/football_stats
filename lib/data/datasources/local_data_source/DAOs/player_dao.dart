import 'package:floor/floor.dart';
import 'package:football_stats/data/models/player_model.dart';

@dao
abstract class PlayerDao {
  @Query('SELECT * FROM Player')
  Future<List<Player>> getPlayers();

  @insert
  Future<void> addPlayer(Player player);

  @delete
  Future<void> removePlayer(Player player);

  @update
  Future<void> updatePlayer(Player player);
}