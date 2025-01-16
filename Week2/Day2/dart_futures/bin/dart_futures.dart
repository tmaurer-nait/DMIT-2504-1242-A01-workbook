import 'package:dart_futures/dart_futures.dart' as dart_futures;
import 'package:dart_futures/dog.dart';

void main(List<String> arguments) async {
  var dogEndpoint = 'https://dog.ceo/api/breeds/image/random';

  var response = await dart_futures.getJSON(dogEndpoint);
  var randomDog = Dog.fromJson(response);

  print(randomDog.imageUri);
}
