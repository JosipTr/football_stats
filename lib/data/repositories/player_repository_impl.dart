import 'package:dartz/dartz.dart';
import 'package:football_stats/data/datasources/local_data_source/database.dart';
import 'package:football_stats/data/models/player_model.dart';
import 'package:football_stats/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final AppDatabase _appDatabase;

  PlayerRepositoryImpl(this._appDatabase);

  @override
  Future<Either<Exception, void>> addPlayer(Player player) async{
    try{
      return Right(await _appDatabase.playerDao.addPlayer(player));
    } catch (e) {
      return Left(Exception(['Error: $e']));
    }
  }

  @override
  Future<Either<Exception, List<Player>>> getPlayers() async{
    try{
      return Right(await _appDatabase.playerDao.getPlayers());
    } catch (e) {
      return Left(Exception(['Error: $e']));
    }
  }

  @override
  Future<Either<Exception, void>> removePlayer(Player player) async{
    try{
      return Right(await _appDatabase.playerDao.removePlayer(player));
    } catch (e) {
      return Left(Exception(['Error: $e']));
    }
  }
  
  @override
  Future<Either<Exception, void>> updatePlayer(Player player) async{
    try{
      return Right(await _appDatabase.playerDao.updatePlayer(player));
    } catch (e) {
      return Left(Exception(['Error: $e']));
    }
  }
}