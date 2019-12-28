import 'dart:convert';


import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      var decodedData = response.body;

      return jsonDecode(decodedData);
    } else {
      print(response.statusCode);
    }
  }
}
