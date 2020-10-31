import 'package:flutter/material.dart';
import 'package:thomas_clark/src/widgets/app_card.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({
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
            title: 'Overview',
            content:
                'Having graduated from the University of Gloucestershire with a first class degree with honours in computing, I am currently working at apetito UK as a developer. I enjoy both web app and mobile app development and I have created a number of professional websites for clients in the past. I have strong practical experience using a variety of languages and frameworks including .NET, Angular, Flutter.',
          ),
        ],
      ),
    );
  }
}
