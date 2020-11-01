// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdi/mdi.dart';
import 'package:thomas_clark/pages/main_page.dart';

void main() {
  group('MainPage', () {
    testWidgets(
      'Displays the home page as the initial destination',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MainPage(),
          ),
        );

        expect(
          find.text('Welcome'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Navigates to the achievements page when the achievements destination is selected',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MainPage(),
          ),
        );

        await tester.tap(find.byIcon(Mdi.trophyOutline));
        await tester.pump();

        expect(
          find.text('Gloucestershire Employability Award'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Navigates to the education page when the education destination is selected',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MainPage(),
          ),
        );

        await tester.tap(find.byIcon(Mdi.schoolOutline));
        await tester.pump();

        expect(
          find.text('GCSE at The Grange School'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Navigates to the experience page when the experience destination is selected',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MainPage(),
          ),
        );

        await tester.tap(find.byIcon(Mdi.briefcaseOutline));
        await tester.pump();

        expect(
          find.text('Garden Centre Assistant at Wyevale Garden Centres'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Navigates to the volunteering page when the volunteering destination is selected',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MainPage(),
          ),
        );

        await tester.tap(find.byIcon(Mdi.heartOutline));
        await tester.pump();

        expect(
          find.text('Boys\' Brigade'),
          findsOneWidget,
        );
      },
    );
  });
}
