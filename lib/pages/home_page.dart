import 'package:flutter/material.dart';
import 'package:thomas_clark/widgets/app_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
            title: 'Welcome',
            content:
                'My name is Thomas Clark and I am a developer specialising in a range of frontend and backend technologies.',
          ),
          AppCard(
            title: 'About',
            content:
                'Having graduated from the University of Gloucestershire with a first class degree with honours in computing, I am currently working at apetito UK as a developer. I enjoy both web app and mobile app development and I have created a number of professional websites for clients in the past. I have strong practical experience using a variety of languages and frameworks including .NET, Angular and Flutter.',
          ),
        ],
      ),
    );
  }
}
