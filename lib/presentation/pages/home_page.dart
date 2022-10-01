import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/presentation/pages/goal_page.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
import 'package:football_stats/utilities/navigation/navigation_cubit.dart';
import '../widgets/app_bar_widgets/add_player_widget.dart';
import '../widgets/nav_bar_widgets/player_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Statistics'),
        actions: const [AddPlayerWidget()],
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
