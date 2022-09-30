part of 'player_bloc.dart';

abstract class PlayerEvent {}

class GetPlayersEvent extends PlayerEvent{}

class AddPlayerEvent extends PlayerEvent{
  final Player player;

  AddPlayerEvent(this.player);
}

class RemovePlayerEvent extends PlayerEvent {
  final Player player;

  RemovePlayerEvent(this.player);
}