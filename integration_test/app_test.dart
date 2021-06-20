import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mdi/mdi.dart';
import 'package:thomas_clark/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byIcon(Mdi.home), findsOneWidget);

    await tester.tap(find.byIcon(Mdi.briefcaseOutline));
    await tester.pumpAndSettle();

    expect(find.byIcon(Mdi.briefcase), findsOneWidget);

    await tester.tap(find.byIcon(Mdi.schoolOutline));
    await tester.pumpAndSettle();

    expect(find.byIcon(Mdi.school), findsOneWidget);

    await tester.tap(find.byIcon(Mdi.heartOutline));
    await tester.pumpAndSettle();

    expect(find.byIcon(Mdi.heart), findsOneWidget);

    await tester.tap(find.byIcon(Mdi.trophyOutline));
    await tester.pumpAndSettle();

    expect(find.byIcon(Mdi.trophy), findsOneWidget);
  });
}
