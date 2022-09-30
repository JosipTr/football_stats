import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
import 'package:football_stats/utilities/navigation/navigation_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Statistics')),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Golovi'
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Asistencije'
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.deblur),
                label: 'Kartoni'
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.delete),
                label: 'Treninzi'
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Utakmice'
                )
            ],
            onTap: (index) {
              if (index == 0) {
                context.read<NavigationCubit>().getNavBarItem(NavBarItem.goal);
              } else if (index == 1) {
                context.read<NavigationCubit>().getNavBarItem(NavBarItem.assist);
              } else if (index == 2) {
                context.read<NavigationCubit>().getNavBarItem(NavBarItem.card);
              } else if (index == 3) {
                context.read<NavigationCubit>().getNavBarItem(NavBarItem.training);
              } else if (index == 4) {
                context.read<NavigationCubit>().getNavBarItem(NavBarItem.match);
              }
            },
            );
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