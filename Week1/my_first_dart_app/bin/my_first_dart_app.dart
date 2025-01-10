import 'dart:io';

import 'package:my_first_dart_app/input_helpers.dart';

void main(List<String> arguments) {
  var name = prompt('Hello! Please enter your name');

  var semRating = promptInt('How have you been finding this semester (1-5)?');

  stdout.writeln('Hello $name! I have recorded your rating of $semRating');
}
