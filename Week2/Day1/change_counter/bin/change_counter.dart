import 'package:change_counter/change_counter.dart' as change_counter;

void main(List<String> arguments) {
  var coinsInPocket = change_counter.promptForChange();

  var total = change_counter.getTotal(coinCounts: coinsInPocket);

  print('Your total change is worth: \$${total / 100}');
}
