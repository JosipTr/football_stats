import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/player_model.dart';
import '../../../../presentation/bloc/player_bloc.dart';

void showAddCardDialog(BuildContext context, Player player) {
  showDialog(
      context: context,
      builder: (context) {
        late String yellow;
        late String red;
        return AlertDialog(
          title: const Text('Unesi broj kartona'),
          actions: [
            
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Žuti karton:',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => yellow = value,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Crveni karton:',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => red = value,
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
                    player.yellowCards = int.parse(yellow);
                    player.redCards = int.parse(red);
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
