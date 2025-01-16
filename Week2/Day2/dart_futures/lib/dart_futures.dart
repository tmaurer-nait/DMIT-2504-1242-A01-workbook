import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getJSON(String endpoint) async {
  var uri = Uri.parse(endpoint); // Create URI object from the string
  var response = await http.get(uri); // make the http request
  return jsonDecode(response.body);
}
