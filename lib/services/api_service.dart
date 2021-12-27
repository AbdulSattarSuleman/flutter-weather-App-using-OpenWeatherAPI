import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ApiService {
  getCityWeather() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {});
    // final allCitiesUrl = Uri.parse(uri);

    // http.Response response = await http.get(
    //     "https://api.openweathermap.org/data/2.5/weather?q=karachi&units=imperial&appid=1137d4b46dee4d51f303660eca05a5f8");
    // var results = jsonDecode(response.body);
  }
}
