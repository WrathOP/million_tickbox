import 'package:flutter_test/flutter_test.dart';
import 'package:million_tickbox/src/app/main_app.dart';

void main() {
  testWidgets('Start Game Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our counter starts at 0.
    expect(find.text('Start Game'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('Play'));
    await tester.pump();
  });
}
