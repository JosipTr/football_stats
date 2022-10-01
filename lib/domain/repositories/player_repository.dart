import 'package:dartz/dartz.dart';
import 'package:football_stats/data/models/player_model.dart';

abstract class PlayerRepository {
  Future<Either<Exception, List<Player>>> getPlayers();
  Future<Either<Exception, void>> addPlayer(Player player);
  Future<Either<Exception, void>> removePlayer(Player player);
  Future<Either<Exception, void>> updatePlayer(Player player);
}