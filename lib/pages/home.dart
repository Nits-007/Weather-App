import 'package:flutter/material.dart';
import 'package:weatherapp/api/weatherapi.dart';
import 'package:weatherapp/components/searchbar.dart';
import '../components/weatherbox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? wicon;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: wicon != null
      ? (wicon == '01d' || wicon == '02d'
          ? const Color.fromARGB(255, 255, 190, 59)
          : wicon == '10d'
              ? const Color.fromARGB(255, 188, 124, 87)
              : wicon == '03d'
                  ? const Color.fromARGB(255, 227, 219, 219)
                  : wicon == '04d' || wicon == '09d' || wicon == '11d'
                      ? Colors.blueGrey
                      : wicon == '13d'
                          ? Colors.blue
                          : wicon == '01n' || wicon == '02n'
                              ? const Color.fromARGB(255, 20, 20, 22)
                              : wicon == '03n'
                                  ? const Color.fromARGB(255, 78, 77, 77)
                                  : const Color.fromARGB(255, 51, 51, 51))
      : Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'CLimate Cast',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBars(),
            FutureBuilder(
              future: fetchWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  wicon = snapshot.data![0][0]['icon'].toString();
                  return WeatherBox(
                    temp: ((-273.15 + snapshot.data![1]['temp']).toString()).substring(0, 4),
                    mintemp: ((-273.15 + snapshot.data![1]['temp_min']).toString()).substring(0, 4),
                    maxtemp: ((-273.15 + snapshot.data![1]['temp_max']).toString()).substring(0, 4),
                    wicon: snapshot.data![0][0]['icon'].toString(),
                    wdesc: snapshot.data![0][0]['description'].toString(),
                    hum: snapshot.data![1]['humidity'].toString(),
                    screenWidth: screenWidth,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

