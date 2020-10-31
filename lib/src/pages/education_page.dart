import 'package:flutter/material.dart';
import 'package:thomas_clark/src/widgets/app_card.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({
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
            title: 'Computing BSc (Hons) at University of Gloucestershire',
            subtitle: 'September 2015 - July 2019',
            content:
                'I graduated with a first class degree with honours after studying modules including Introduction To Website Development, Agile Methods, Mobile Application Development and Advanced Database Systems.',
          ),
          AppCard(
            title: 'Advanced Level at St. Brendan\'s Sixth Form College',
            subtitle: 'September 2013 - July 2015',
            content:
                'Applied IT (B), Computing (C), Chemistry (C), Mathematics (D).',
          ),
          AppCard(
            title: 'GCSE at The Grange School',
            subtitle: 'September 2008 - July 2013',
            content:
                '9 Grade A-C, IT Diploma, English Baccalaureate, Functional Skills.',
          ),
        ],
      ),
    );
  }
}
