import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/data/models/player_model.dart';
import 'package:football_stats/presentation/bloc/player_bloc.dart';
import 'package:football_stats/presentation/pages/goal_page.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
import 'package:football_stats/utilities/navigation/navigation_cubit.dart';
import '../widgets/app_bar_widgets/add_player_widget.dart';
import '../widgets/app_bar_widgets/menu_widget.dart';
import '../widgets/nav_bar_widgets/player_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Statistics'),
        actions: [
          Row(
            children: [
              Icon(Icons.add)
            ],
          ),
          Row(
            children: [
              AddPlayerWidget(),
              PopupMenuButton<int>(
                itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: Text('Select all'),
                    onTap: () {
                      List<Player> players = context.read<PlayerBloc>().players;
                      for (int i = 0; i < players.length; i++) {
                        players[i].isSelected = !players[i].isSelected;
                        context.read<PlayerBloc>().add(UpdatePlayerEvent(players[i]));
                      }
                    },
                    )
                ])
                ),
            ],
          )
          ],
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return PlayerBottomNavigationBar(state: state);
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navBarItem == NavBarItem.goal) {
            return const GoalPage();
          } else if (state.navBarItem == NavBarItem.assist) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.card) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.training) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.match) {
            return const Scaffold();
          }
          return const Text('Error');
        },
      ),
    );
  }
}

