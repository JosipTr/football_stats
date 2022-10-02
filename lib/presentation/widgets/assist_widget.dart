import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/logic/functions/show_dialog/show_add_assist_dialog.dart';
import '../bloc/player_bloc.dart';

class AssistWidget extends StatelessWidget {
  final Loaded state;
  const AssistWidget({
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
                    'Asistencije: ${state.players[index].assists} \nAsistencije po utakmici: ${state.players[index].getAssistsPerMatch()} | ${state.players[index].getAssistsEfficiency()} %')
              ],
            ),
            onTap: () => showAddAssistDialog(context, state.players[index]),
            onLongPress: () {
              state.players[index].isSelected =
                  !state.players[index].isSelected;
              context
                  .read<PlayerBloc>()
                  .add(UpdatePlayerEvent(state.players[index]));
            })));
  }
}