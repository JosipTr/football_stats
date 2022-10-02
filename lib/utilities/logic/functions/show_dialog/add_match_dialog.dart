import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/player_model.dart';
import '../../../../presentation/bloc/player_bloc.dart';

void showAddMatchDialog(BuildContext context, Player player) {
  showDialog(
      context: context,
      builder: (context) {
        late String match;
        return AlertDialog(
          title: const Text('Unesi broj utakmica'),
          actions: [
            
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => match = value,
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
                    player.matchesPlayed = int.parse(match);
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
