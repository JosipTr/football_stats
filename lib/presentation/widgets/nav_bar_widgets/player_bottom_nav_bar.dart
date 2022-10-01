import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/navigation/constants/nav_bar_item.dart';
import '../../../utilities/navigation/navigation_cubit.dart';

class PlayerBottomNavigationBar extends StatelessWidget {
  final NavigationState state;
  const PlayerBottomNavigationBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: const Color.fromARGB(255, 42, 65, 83),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      currentIndex: state.index,
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Image(image: AssetImage('assets/goal.png')),
            label: 'Golovi'),
        BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Image(image: AssetImage('assets/assistance.png')),
            label: 'Asistencije'),
        BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Image(image: AssetImage('assets/red-card.png')),
            label: 'Kartoni'),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Image(image: AssetImage('assets/training.png')),
            label: 'Treninzi'),
        BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Image(image: AssetImage('assets/scoreboard.png')),
            label: 'Utakmice')
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
  }
}
