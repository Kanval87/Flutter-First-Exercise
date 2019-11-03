import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:text_manager/main.dart';
import 'package:text_manager/itemManager.dart';

void main() {
  testWidgets(
    'Counter increments smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that we have app bar displayed
      expect(find.text('App Bar'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Find the press button and click it
//      expect(find.byType(ItemManager()), matcher)
    },
  );
}
