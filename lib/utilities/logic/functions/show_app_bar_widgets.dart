  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/utilities/logic/functions/remove_selected_players.dart';
import 'package:football_stats/utilities/logic/functions/show_unselected.dart';
import 'package:football_stats/utilities/logic/functions/switch_select_state.dart';

import '../../../presentation/bloc/player_bloc.dart';
import 'check_if_selected.dart';

BlocBuilder<PlayerBloc, PlayerState> showAppBarWidgets() {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: ((context, state) {
          if (state is Loaded) {
            if (checkIfSelected(state)) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () => removeSelectedPlayers(state, context), 
                    icon: const Icon(Icons.delete)
                    ),
                  IconButton(
                    onPressed: () => switchSelectState(context, state.players), 
                    icon: const Icon(Icons.cancel)
                    )
                ],
              );
            } else {
              return showUnselected(state);
            }
          } else {
            return const Icon(Icons.deblur);
          }
        }));
  }