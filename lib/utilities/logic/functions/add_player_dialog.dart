  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/player_model.dart';
import '../../../presentation/bloc/player_bloc.dart';

void showAddPlayerDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          late String name;
          late String surname;
          return AlertDialog(
            title: const Text('Dodaj igrača'),
            actions: [
              TextField(
                onChanged: (value) => name = value,
              ),
              TextField(
                onChanged: (value) => surname = value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Odustani')),
                  TextButton(
                      onPressed: () {
                        context.read<PlayerBloc>().add(
                            AddPlayerEvent(Player(name: name, surname: surname)));
                        Navigator.of(context).pop();
                      },
                      child: const Text('Dodaj')),
                ],
              )
            ],
          );
        }));
  }