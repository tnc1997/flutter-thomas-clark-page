import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('', () {
    final achievementsIconFinder = find.byValueKey(
      'achievements_icon',
    );
    final achievementsOutlineIconFinder = find.byValueKey(
      'achievements_outline_icon',
    );
    final educationIconFinder = find.byValueKey(
      'education_icon',
    );
    final educationOutlineIconFinder = find.byValueKey(
      'education_outline_icon',
    );
    final experienceIconFinder = find.byValueKey(
      'experience_icon',
    );
    final experienceOutlineIconFinder = find.byValueKey(
      'experience_outline_icon',
    );
    final homeIconFinder = find.byValueKey(
      'home_icon',
    );
    final homeOutlineIconFinder = find.byValueKey(
      'home_outline_icon',
    );
    final volunteeringIconFinder = find.byValueKey(
      'volunteering_icon',
    );
    final volunteeringOutlineIconFinder = find.byValueKey(
      'volunteering_outline_icon',
    );

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('', () async {
      await driver.waitFor(experienceOutlineIconFinder);
      await driver.tap(experienceOutlineIconFinder);
      await driver.waitFor(experienceIconFinder);

      await driver.waitFor(educationOutlineIconFinder);
      await driver.tap(educationOutlineIconFinder);
      await driver.waitFor(educationIconFinder);

      await driver.waitFor(volunteeringOutlineIconFinder);
      await driver.tap(volunteeringOutlineIconFinder);
      await driver.waitFor(volunteeringIconFinder);

      await driver.waitFor(achievementsOutlineIconFinder);
      await driver.tap(achievementsOutlineIconFinder);
      await driver.waitFor(achievementsIconFinder);
    });
  });
}
