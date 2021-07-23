import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({
    Key? key,
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
            title: 'Developer at apetito',
            subtitle: '2019 - To Date',
            content:
                'After graduating, I returned as part of their graduate scheme where I orchestrated their migration to microservices using ASP.NET Core and Docker. This was something that I owned from start to finish and continue to improve upon. It also included the creation of a developer portal for our third-party integrators, who I work closely with during onboarding to ensure that they have the best possible experience.',
          ),
          AppCard(
            title: 'Developer at apetito',
            subtitle: '2017 - 2018',
            content:
                'During my time at University, I completed a placement year where I worked as a developer primarily on their Business-to-Business (B2B) web and mobile apps using Angular and Ionic. It was during this placement year that I redeveloped the flagship ordering system’s admin portal.',
          ),
          AppCard(
            title: 'Garden Centre Assistant at Wyevale Garden Centres',
            subtitle: '2013 - 2015',
            content:
                'My duties included operating the tills, watering the indoor houseplants and outdoor plants and assisting customers with heavy loads.',
          ),
        ],
      ),
    );
  }
}
