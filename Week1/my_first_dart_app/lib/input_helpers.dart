import 'dart:io';

String prompt(String message) {
  // Output the message to the user
  stdout.writeln(message);

  // Read the user input
  var userInput = stdin.readLineSync();

  // Return the user input if it exists, else return empty string
  return userInput ?? '';
}

int promptInt(String message) {
  // Output the message to the user
  var userInput = prompt(message);

  late int returnVal;

  var isValid = false;

  while (!isValid) {
    try {
      returnVal = int.parse(userInput);
      isValid = true;
    } catch (e) {
      userInput = prompt('Invalid input, please enter an int');
    }
  }

  // Return the user input if it exists, else return empty string
  return returnVal;
}
