import 'dart:io';

/// Prompts the user for change
/// [Returns] ordered list of coins (pennies, nickels, dimes, quarters, loonies, toonies)
List<int> promptForChange() {
  List<int> output = [];

  List<String> coinTypes = [
    'pennies',
    'nickels',
    'dimes',
    'quarters',
    'loonies',
    'toonies'
  ];

  for (var coinType in coinTypes) {
    // output to the user asking how many coins they have
    stdout.writeln('How many $coinType do you have?');

    late int coinCount;

    // read the user input
    try {
      coinCount = int.parse(stdin.readLineSync()!);
    } catch (e) {
      throw Exception('User did not enter an integer');
    }

    // if positive integer add to output
    // else throw exception
    if (coinCount < 0) {
      throw Exception('User entered a negative number');
    }
    output.add(coinCount);
  }

  return output;
}

// [Returns] the total number of cents given an ordered list of coins
int getTotal({required List<int> coinCounts}) {
  int total = 0;

  total += coinCounts[0];
  total += coinCounts[1] * 5;
  total += coinCounts[2] * 10;
  total += coinCounts[3] * 25;
  total += coinCounts[4] * 100;
  total += coinCounts[5] * 200;

  return total;
}
