import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/player_model.dart';
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
            tileColor:
                state.players[index].isSelected ? Colors.grey : Colors.white,
            leading: CircleAvatar(child: Text('${state.players[index].id}')),
            title: Text(
                '${state.players[index].name} ${state.players[index].surname}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Golovi: ${state.players[index].goals} \nGolovi po utakmici: ${state.players[index].getGoalPerMatch()} | ${state.players[index].getGoalEfficiency()}')
              ],
            ),
            onTap: () => showAddGoalsDialog(context, state.players[index]),
            onLongPress: () {
              state.players[index].isSelected =
                  !state.players[index].isSelected;
              context
                  .read<PlayerBloc>()
                  .add(UpdatePlayerEvent(state.players[index]));
            })));
  }
}

void showAddGoalsDialog(BuildContext context, Player player) {
  showDialog(
      context: context,
      builder: (context) {
        late String goals;
        return AlertDialog(
          title: const Text('Unesi broj golova'),
          actions: [
            
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => goals = value,
              ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Odustani')),
            TextButton(
                onPressed: () {
                  try {
                    player.goals = int.parse(goals);
                    context.read<PlayerBloc>().add(UpdatePlayerEvent(player));
                    context.read<PlayerBloc>().add(GetPlayersEvent());
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Pogreška!'),
                    ));
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Dodaj')),
          ],
          )
          ],
        );
      });
}
