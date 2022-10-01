  import 'package:flutter/material.dart';

import '../../../presentation/bloc/player_bloc.dart';
import '../../../presentation/widgets/app_bar_widgets/add_player_widget.dart';
import '../../../presentation/widgets/app_bar_widgets/menu_widget.dart';

Row showUnselected(Loaded state) {
    return Row(
                children: [
                  const AddPlayerWidget(),
                  MenuWidget(players: state.players)
                ],
              );
  }