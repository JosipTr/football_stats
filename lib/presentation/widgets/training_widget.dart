import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/logic/functions/show_dialog/add_training_dialog.dart';
import '../bloc/player_bloc.dart';

class TrainingWidget extends StatelessWidget {
  final Loaded state;
  const TrainingWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.players.length,
        itemBuilder: ((context, index) => ListTile(
            tileColor:
                state.players[index].isSelected ? Colors.grey : Colors.white,
            leading: CircleAvatar(child: Text('${state.players[index].id}')),
            title: Text(
                '${state.players[index].name} ${state.players[index].surname}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Treninzi: ${state.players[index].trainingDays} \nEfikasnost: ${state.players[index].getTrainingEfficiency()}')
              ],
            ),
            onTap: () => showAddTrainingDialog(context, state.players[index]),
            onLongPress: () {
              state.players[index].isSelected =
                  !state.players[index].isSelected;
              context
                  .read<PlayerBloc>()
                  .add(UpdatePlayerEvent(state.players[index]));
            })));
  }
}