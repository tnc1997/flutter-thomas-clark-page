import 'package:flutter/material.dart';
import 'package:thomas_clark/states/theme_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<ThemeMode>(
            items: [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text('System'),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Light'),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark'),
              ),
            ],
            value: ThemeState.of(context).themeMode,
            onChanged: (value) {
              ThemeState.of(context).themeMode = value;
            },
            decoration: InputDecoration(
              labelText: 'Theme',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
