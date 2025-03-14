import 'package:test/test.dart';

import 'package:testing_example/models/user.dart';

void main() {
  group('User Model tests', () {
    late User user;

    setUp(() {
      user = User(email: 'tmaurer@nait.ca', name: 'Tom Maurer');
    });

    test('User should have name and email', () {
      expect(user.name, 'Tom Maurer');
      expect(user.email, 'tmaurer@nait.ca');
    });

    test('toString() should be overriden correctly', () {
      // Arrange
      var expected = 'Name: Tom Maurer, Email: tmaurer@nait.ca';
      String actual;

      // Act
      actual = user.toString();

      // Assert
      expect(actual, expected);
    });
  });
}
