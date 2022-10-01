import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';

class GoalWidget extends StatelessWidget {
  final Loaded state;
  const GoalWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.players.length,
        itemBuilder: ((context, index) => ListTile(
          tileColor: state.players[index].isSelected ? Colors.grey : Colors.white,
          leading: CircleAvatar(child: Text('${state.players[index].id}')),
              title: Text(state.players[index].name),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context
                        .read<PlayerBloc>()
                        .add(RemovePlayerEvent(state.players[index]));
                  }),
                  onLongPress: () {
                    state.players[index].isSelected = !state.players[index].isSelected;
                    context.read<PlayerBloc>().add(UpdatePlayerEvent(state.players[index]));
                  } 
            )));
  }
}
