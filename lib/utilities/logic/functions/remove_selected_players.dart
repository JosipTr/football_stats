import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/bloc/player_bloc.dart';

void removeSelectedPlayers(Loaded state, BuildContext context) {
  for (int i = 0; i < state.players.length; i++) {
    if (state.players[i].isSelected == true) {
      context.read<PlayerBloc>().add(RemovePlayerEvent(state.players[i]));
    }
  }
}