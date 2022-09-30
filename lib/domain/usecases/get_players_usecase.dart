import 'package:dartz/dartz.dart';
import 'package:football_stats/domain/repositories/player_repository.dart';

import '../../data/models/player_model.dart';

class GetPlayers {
  final PlayerRepository _repository;

  GetPlayers(this._repository);

  Future<Either<Exception, List<Player>>> call() async {
    return await _repository.getPlayers();
  }
}