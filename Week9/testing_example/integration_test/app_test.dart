import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Main App End to End Tests', () {
    testWidgets(
      'Tap on the floating action button and verify name and email are visible',
      (tester) async {
        // Arrange
        await tester.pumpWidget(MainApp());

        // Act(ish)
        // Find the widgets
        final emailFinder = find.text('Email: tmaurer@nait.ca');
        final fabFinder = find.byType(FloatingActionButton);

        // Should find nothing
        expect(find.text('Name: Tom Maurer'), findsNothing);
        expect(emailFinder, findsNothing);

        // Click the button and wait for renders
        await tester.tap(fabFinder);
        await tester.pumpAndSettle();

        expect(find.text('Name: Tom Maurer'), findsOneWidget);
        expect(emailFinder, findsOneWidget);
      },
    );
  });
}
