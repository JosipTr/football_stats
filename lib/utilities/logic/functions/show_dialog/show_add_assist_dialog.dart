import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/player_model.dart';
import '../../../../presentation/bloc/player_bloc.dart';

void showAddAssistDialog(BuildContext context, Player player) {
  showDialog(
      context: context,
      builder: (context) {
        late String assist;
        return AlertDialog(
          title: const Text('Unesi broj asistencija'),
          actions: [
            
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => assist = value,
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
                    player.assists = int.parse(assist);
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
