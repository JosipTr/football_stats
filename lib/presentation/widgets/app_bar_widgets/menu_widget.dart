import 'package:flutter/material.dart';

import '../../../data/models/player_model.dart';
import '../../../utilities/logic/functions/switch_select_state.dart';

class MenuWidget extends StatelessWidget {
  final List<Player> players;
  const MenuWidget({
    Key? key, required this.players,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        itemBuilder: ((context) => [
              PopupMenuItem(
                value: 1,
                child: const Text('Select all'),
                onTap: () {
                  switchSelectState(context, players);
                },
              )
            ]));
  }


}