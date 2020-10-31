import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class VolunteeringPage extends StatelessWidget {
  const VolunteeringPage({
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
            title: 'IT Schools Africa',
            content:
                'During my time at University, I volunteered regularly on a weekly basis at IT Schools Africa, who refurbish old donated computers and laptops before sending them to Africa to be used in schools for education.',
          ),
          AppCard(
            title: 'Boys\' Brigade',
            content:
                'Before starting University, I regularly volunteered at my local youth group where I assisted the leaders with activities. It was during this time that I also developed a new website for them, which I continue to maintain.',
          ),
        ],
      ),
    );
  }
}
