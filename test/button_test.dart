import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sushi_restaurant/components/button.dart';

void main() {
  testWidgets('MyButton test', (WidgetTester tester) async {
    final testKey = Key('myButton');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyButton(
            key: testKey,
            text: 'Test',
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });
}