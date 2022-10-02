
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/presentation/pages/assist_page.dart';
import 'package:football_stats/presentation/pages/card_page.dart';
import 'package:football_stats/presentation/pages/goal_page.dart';
import 'package:football_stats/presentation/pages/match_page.dart';
import 'package:football_stats/presentation/pages/training_page.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
import 'package:football_stats/utilities/navigation/navigation_cubit.dart';
import '../../utilities/logic/functions/show_app_bar_widgets.dart';
import '../widgets/nav_bar_widgets/player_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Statistics'),
        actions: [
          showAppBarWidgets()
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
            return const AssistPage();
          } else if (state.navBarItem == NavBarItem.card) {
            return const CardPage();
          } else if (state.navBarItem == NavBarItem.training) {
            return const TrainingPage();
          } else if (state.navBarItem == NavBarItem.match) {
            return const MatchPage();
          }
          return const Text('Error');
        },
      ),
    );
  }
}



