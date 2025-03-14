import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/widgets/user_widget.dart';
import 'package:testing_example/models/user.dart';

void main() {
  late User user;
  late Widget app;

  setUp(() {
    user = User(email: 'tmaurer@nait.ca', name: 'Tom Maurer');

    app = MaterialApp(
      home: Scaffold(
        body: UserWidget(user: user),
      ),
    );
  });

  testWidgets('UserWidget displays name and email of the user',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(app);

    // Act(ish)
    // Find the widgets
    final nameFinder = find.text('Name: Tom Maurer');
    final emailFinder = find.text('Email: tmaurer@nait.ca');

    // Assert
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
