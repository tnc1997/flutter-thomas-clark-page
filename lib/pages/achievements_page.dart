import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({
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
            title: 'Kick Start',
            content:
                'I competed in 4 rounds of Kick Start 2020, which is a global online coding competition, consisting of three-hour rounds of a variety of algorithmic challenges designed by Google engineers.',
          ),
          AppCard(
            title: 'Code Jam',
            content:
                'I progressed to Round 1 of Code Jam 2020, which is Google\'s longest running global coding competition, where programmers of all levels put their skills to the test.',
          ),
          AppCard(
            title: 'Gloucestershire Employability Award',
            content:
                'During my time at University, I achieved the Gloucestershire Employability Award by participating in a number of employability events and undertaking over 50 hours of work experience.',
          ),
        ],
      ),
    );
  }
}
