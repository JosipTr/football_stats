import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/data/models/player_model.dart';
import 'package:football_stats/domain/usecases/add_player_usecase.dart';
import 'package:football_stats/domain/usecases/get_players_usecase.dart';
import 'package:football_stats/domain/usecases/remove_player_usecase.dart';
import 'package:football_stats/domain/usecases/update_player_usecase.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final GetPlayers _getPlayers;
  final AddPlayer _addPlayer;
  final RemovePlayer _removePlayer;
  final UpdatePlayer _updatePlayer;

  List<Player> players = List.empty(growable: true);

  PlayerBloc(this._getPlayers, this._addPlayer, this._removePlayer, this._updatePlayer)
      : super(PlayerInitial()) {
    on<GetPlayersEvent>(_onGetPlayersEvent);
    on<AddPlayerEvent>(_onAddPlayerEvent);
    on<RemovePlayerEvent>(_onRemovePlayerEvent);
    on<UpdatePlayerEvent>(_onUpdatePlayerEvent);
  }

  void _onGetPlayersEvent(
      GetPlayersEvent event, Emitter<PlayerState> emit) async {
    var either = await _getPlayers.call();
    either.fold((l) => Exception(), (r) => players = r);
    if (players.isEmpty) {
      emit(Empty('Empty list'));
    } else {
      emit(Loaded(players));
    }
  }

  void _onAddPlayerEvent(
      AddPlayerEvent event, Emitter<PlayerState> emit) async {
    var either = await _addPlayer.call(event.player);
    print('success');
    either.fold((l) => Exception(), (r) => players.add(event.player));
    emit(Loaded(players));
  }

  void _onRemovePlayerEvent(
      RemovePlayerEvent event, Emitter<PlayerState> emit) async {
    var either = await _removePlayer.call(event.player);
    either.fold((l) => Exception(), (r) => players.remove(event.player));
    if (players.isEmpty) {
      emit(Empty('Empty list'));
    } else {
      emit(Loaded(players));
    }
  }

  void _onUpdatePlayerEvent(
      UpdatePlayerEvent event, Emitter<PlayerState> emit) async {
    var either = await _updatePlayer.call(event.player);
    either.fold((l) => Exception(), (r) {
        players[players.indexWhere((element) => element.id == event.player.id)] = event.player;
      });
    if (players.isEmpty) {
      emit(Empty('Empty list'));
    } else {
      emit(Loaded(players));
    }
  }
}
