import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_stats/presentation/bloc/player_bloc.dart';
import '../widgets/card_widget.dart';
import '../widgets/empty_state_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      if (state is Loaded) {
        return CardWidget(state: state);
      } else if (state is Empty) {
        return const EmptyStateWidget();
      } else if (state is Loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is Error) {
        return const Text('Error');
      } else {
        return Container();
      }
    });
  }
}
