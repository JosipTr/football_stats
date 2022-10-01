  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/player_model.dart';
import '../../../presentation/bloc/player_bloc.dart';

void switchSelectState(BuildContext context, List<Player> players) {
    for (int i = 0; i < players.length; i++) {
      players[i].isSelected = false;
      context
          .read<PlayerBloc>()
          .add(UpdatePlayerEvent(players[i]));
    }
  }