import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/searchbar.dart';

double globalLatitude = 0.0;
double globalLongitude = 0.0;

Future<List> fetchlocation() async {
  String cityName = SearchBars.searchController.text.trim();

  // Set default city to London if the search bar is empty
  if (cityName.isEmpty) {
    cityName = 'prayagraj';
  }

  http.Response response;

  try {
    response = await http.get(
      Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=2156cc740925604cb1a739f7a9245fd5'),
    );

    dynamic locationResult = jsonDecode(response.body);

    double latitude = 0.0;
    double longitude = 0.0;

    if (locationResult is List && locationResult.isNotEmpty) {
      Map<String, dynamic> locationData = locationResult[0];
      latitude = locationData['lat'];
      longitude = locationData['lon'];
    } else if (locationResult is Map) {
      latitude = locationResult['lat'];
      longitude = locationResult['lon'];
    }

    globalLatitude = latitude;
    globalLongitude = longitude;

    return [globalLatitude, globalLongitude];
  } catch (e) {
    print('Error fetching location: $e');
    // Handle the error or return a default value
    return [0.0, 0.0];
  }
}
