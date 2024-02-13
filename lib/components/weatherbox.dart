import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherBox extends StatelessWidget {
  final String temp, mintemp, maxtemp, wicon, wdesc, hum;
  final double screenWidth;

  const WeatherBox({
    Key? key,
    required this.temp,
    required this.mintemp,
    required this.maxtemp,
    required this.wicon,
    required this.wdesc,
    required this.hum,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 3 * (screenWidth) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 249, 249, 249),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://openweathermap.org/img/wn/${wicon}@2x.png',
                imageBuilder: (context, imageProvider) => Container(
                  width: screenWidth < 600 ? 100 : 160,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(color: Colors.black),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  wdesc,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,) ,
        Container(
          height: 200,
          width: 3 * (screenWidth) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 249, 249, 249),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const BoxedIcon(
                WeatherIcons.thermometer,
                color: Colors.black,
                size: 72,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${temp}ºC',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,) ,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
          children: [
            _buildInfoContainer(
              const BoxedIcon(WeatherIcons.direction_down, color: Colors.black, size: 24),
              '$mintempºC',
            ),
            _buildInfoContainer(
              const BoxedIcon(WeatherIcons.humidity, color: Colors.black, size: 24),
              '$hum%',
            ),
            _buildInfoContainer(
              const BoxedIcon(WeatherIcons.direction_up, color: Colors.black, size: 24),
              '$maxtempºC',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoContainer(Widget icon, String text) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 249, 249, 249),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
