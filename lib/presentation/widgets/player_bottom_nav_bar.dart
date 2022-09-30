import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/navigation/constants/nav_bar_item.dart';
import '../../utilities/navigation/navigation_cubit.dart';

class PlayerBottomNavigationBar extends StatelessWidget {
  final NavigationState state;
  const PlayerBottomNavigationBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      currentIndex: state.index,
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.add),
            label: 'Golovi'),
        BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.search),
            label: 'Asistencije'),
        BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.deblur),
            label: 'Kartoni'),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.delete),
            label: 'Treninzi'),
        BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.shop),
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
