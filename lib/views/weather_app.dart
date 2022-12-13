import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/weather_model.dart';
import '../services/weather_api_client.dart';
import 'additional_information.dart';
import 'current_weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("america");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Image.asset(
                  "assets/sunny.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                          "${data!.cityName}"),
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        "Additional Information",
                        style: GoogleFonts.anton(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontSize: 30,
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.0,
                      ),
                      additionalInformation(
                          "${data!.wind}",
                          "${data!.humidity}",
                          "${data!.pressure}",
                          "${data!.feels_like}"),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
