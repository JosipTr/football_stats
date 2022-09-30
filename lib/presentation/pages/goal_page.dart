import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/presentation/bloc/player_bloc.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
        if (state is Loaded) {
          return ListView.builder(
              itemCount: state.players.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(state.players[index].name),
                    trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
                      context.read<PlayerBloc>().add(RemovePlayerEvent(state.players[index]));
                      context.read<PlayerBloc>().add(GetPlayersEvent());
                    }),
                  )));
        } else if (state is Empty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Lista je prazna.', style: TextStyle(fontSize: 40),),
                Text('Unesi igrače.', style: TextStyle(fontSize: 40),),
              ],
            ),
          );
        } else if (state is Loading) {
          return CircularProgressIndicator();
        } else if (state is Error) {
          return SnackBar(content: Text(state.message));
        } else {
          return Container();
        }
      }),
    );
  }
}
