part of 'player_bloc.dart';

abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class Loading extends PlayerState {}

class Loaded extends PlayerState{
  final List<Player> players;

  Loaded(this.players);
}

class Error extends PlayerState {
  final String message;

  Error(this.message);
}