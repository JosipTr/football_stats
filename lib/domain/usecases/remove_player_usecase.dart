import 'package:dartz/dartz.dart';
import 'package:football_stats/domain/repositories/player_repository.dart';

import '../../data/models/player_model.dart';

class RemovePlayer {
  final PlayerRepository _repository;

  RemovePlayer(this._repository);

  Future<Either<Exception, void>> call(Player player) async {
    return await _repository.removePlayer(player);
  }
}