import 'package:flutter_test/flutter_test.dart';
import 'package:ecopatch_app/main.dart';

void main() {
  testWidgets('EcoPatchApp initial smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EcoPatchApp());
    expect(find.text('Plant Library'), findsWidgets);
  });
}
