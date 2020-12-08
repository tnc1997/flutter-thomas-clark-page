import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? content;

  const AppCard({
    Key? key,
    this.title,
    this.subtitle,
    this.content,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final subtitle = this.subtitle;
    final content = this.content;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  content,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
