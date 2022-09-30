import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/utilities/navigation/constants/nav_bar_item.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItem.goal, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.goal : emit(NavigationState(NavBarItem.goal, 0));
      break;
      case NavBarItem.assist : emit(NavigationState(NavBarItem.assist, 1));
      break;
      case NavBarItem.card : emit(NavigationState(NavBarItem.card, 2));
      break;
      case NavBarItem.training : emit(NavigationState(NavBarItem.training, 3));
      break;
      case NavBarItem.match : emit(NavigationState(NavBarItem.match, 4));
      break;
    }
  }
}