import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pbm2/main.dart';

void main() {
  testWidgets('App shows friends list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Esia Friend'), findsOneWidget);

    // Verify that all friends are displayed
    expect(find.text('Nur Adam Mahfudh'), findsOneWidget);
    expect(find.text('Samuel Nardus H. Sinaga'), findsOneWidget);
    expect(find.text('Agung Sedayu'), findsOneWidget);
    expect(find.text('Farhan Ramadhan'), findsOneWidget);

    // Optionally, you can test navigation (this is a more complex test)
    // For example, tapping on Samuel's container:
    // await tester.tap(find.text('Samuel Nardus H. Sinaga'));
    // await tester.pumpAndSettle(); // Wait for navigation animation
    // expect(find.text('Samuel Profile'), findsOneWidget);
    // Note: You'd need to mock the SamuelPage for this to work
  });
}