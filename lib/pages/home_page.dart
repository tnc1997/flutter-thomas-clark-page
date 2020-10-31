import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppCard(
            title: 'Welcome',
            content:
                'My name is Thomas Clark and I am a developer specialising in a range of frontend and backend technologies.',
          ),
        ],
      ),
    );
  }
}
