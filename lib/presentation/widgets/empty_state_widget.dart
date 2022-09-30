import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Lista je prazna.', style: TextStyle(fontSize: 40),),
          Text('Unesi igrače.', style: TextStyle(fontSize: 40),),
        ],
      ),
    );
  }
}