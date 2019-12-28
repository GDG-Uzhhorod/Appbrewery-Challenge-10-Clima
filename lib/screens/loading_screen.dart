import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
  }

  Future<void> getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    String data = response.body;

    var temp = jsonDecode(data)['main']['temp'];
    var condition = jsonDecode(data)['weather'][0]['id'];
    var city = jsonDecode(data)['name'];

    print(temp);
    print(condition);
    print(city);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
