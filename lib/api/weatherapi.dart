import 'dart:convert';
import 'package:http/http.dart' as http;
import 'locapi.dart';
Future<List> fetchWeather() async {
  await fetchlocation();
  http.Response response;
  if (globalLatitude != 0.0 && globalLongitude != 0.0) {
    response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$globalLatitude&lon=$globalLongitude&appid=2156cc740925604cb1a739f7a9245fd5'),
    );
  } else {
    response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=25.4381302&lon=81.8338005&appid=2156cc740925604cb1a739f7a9245fd5'),
    );
  }
  Map weatherResult = jsonDecode(response.body);
  return [weatherResult['weather'], weatherResult['main']];
}
