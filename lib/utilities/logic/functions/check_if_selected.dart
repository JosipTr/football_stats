import '../../../presentation/bloc/player_bloc.dart';

bool checkIfSelected(Loaded state) {
  for (int i = 0; i < state.players.length; i++) {
    if (state.players[i].isSelected == true) {
      return true;
    }
  }
  return false;
}