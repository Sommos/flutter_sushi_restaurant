import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sushi_restaurant/main.dart';

void main() {
  testWidgets('Main test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}