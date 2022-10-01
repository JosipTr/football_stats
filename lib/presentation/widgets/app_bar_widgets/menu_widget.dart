import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/player_model.dart';
import '../../bloc/player_bloc.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        itemBuilder: ((context) => [
              PopupMenuItem(
                child: Text('Select all'),
                onTap: () {
                  List<Player> players =
                      context.read<PlayerBloc>().players;
                  for (int i = 0; i < players.length; i++) {
                    players[i].isSelected =
                        !players[i].isSelected;
                    context
                        .read<PlayerBloc>()
                        .add(UpdatePlayerEvent(players[i]));
                  }
                },
              )
            ]));
  }
}