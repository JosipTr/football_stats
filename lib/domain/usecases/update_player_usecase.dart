import 'package:dartz/dartz.dart';
import 'package:football_stats/domain/repositories/player_repository.dart';

import '../../data/models/player_model.dart';

class UpdatePlayer {
  final PlayerRepository _repository;

  UpdatePlayer(this._repository);

  Future<Either<Exception, void>> call(Player player) async {
    return await _repository.updatePlayer(player);
  }
}