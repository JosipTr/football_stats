import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';

class PlayerWidget extends StatelessWidget {
  final Loaded state;
  const PlayerWidget({
    Key? key, required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.players.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(state.players[index].name),
              trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () {
                context.read<PlayerBloc>().add(RemovePlayerEvent(state.players[index]));
              }),
            )));
  }
}