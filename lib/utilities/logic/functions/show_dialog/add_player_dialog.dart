  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/player_model.dart';
import '../../../../presentation/bloc/player_bloc.dart';

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
                decoration: const InputDecoration(
                  hintText: 'Ime:',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                ),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 10,),

              TextField(
                decoration: const InputDecoration(
                  hintText: 'Prezime:',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                ),
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
                        try{
                        context.read<PlayerBloc>().add(
                            AddPlayerEvent(Player(name: name, surname: surname)));
                        context.read<PlayerBloc>().add(GetPlayersEvent());
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pogreška: Unesi ime i prezime'),));
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text('Dodaj')),
                ],
              )
            ],
          );
        }));
  }