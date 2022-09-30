import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
import 'package:football_stats/utilities/navigation/navigation_cubit.dart';

import '../widgets/player_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Statistics')),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return PlayerBottomNavigationBar(state: state,);
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navBarItem == NavBarItem.goal) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.assist) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.card) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.training) {
            return const Scaffold();
          } else if (state.navBarItem == NavBarItem.match) {
            return const Scaffold();
          } return const Text('Error');
        },
      ),
    );
  }
}