import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({
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
            title: 'Developer at apetito UK',
            subtitle: 'August 2019 - To Date',
            content:
                'After graduating from University, I returned to apetito UK as part of their graduate programme to continue working as a developer where I orchestrated their migration to microservices.',
          ),
          AppCard(
            title: 'Developer at apetito UK',
            subtitle: 'June 2017 - July 2018',
            content:
                'During my time at University, I completed a placement year at apetito UK where I spent the majority of the year working as a developer on web apps and mobile apps using Angular and Ionic.',
          ),
          AppCard(
            title: 'Garden Centre Assistant at Wyevale Garden Centres',
            subtitle: 'August 2013 - September 2015',
            content:
                'My duties included operating the tills, watering both the indoor houseplants and outdoor plants, creating outdoor displays, keeping the outdoor areas clean and assisting customers with heavy loads.',
          ),
        ],
      ),
    );
  }
}
