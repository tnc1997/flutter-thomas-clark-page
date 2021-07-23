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
                'My name is Thomas Clark and I am a developer specialising in a range of front-end and back-end technologies.',
          ),
          AppCard(
            title: 'About',
            content:
                'Having graduated from the University of Gloucestershire with a first class degree in computing, I am currently working at apetito as a developer. I enjoy both front-end and back-end development and I have created and deployed multiple applications as part of a team. I have strong practical experience using a variety of frameworks and technologies including Angular, ASP.NET Core, Docker, Flutter, Microsoft Azure and Terraform.',
          ),
        ],
      ),
    );
  }
}
