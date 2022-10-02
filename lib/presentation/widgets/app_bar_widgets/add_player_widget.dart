import 'package:flutter/material.dart';

import '../../../utilities/logic/functions/show_dialog/add_player_dialog.dart';

class AddPlayerWidget extends StatelessWidget {
  const AddPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
        onPressed: () => showAddPlayerDialog(context),
        icon: const Icon(Icons.add),
      ),
    ]);
  }
}