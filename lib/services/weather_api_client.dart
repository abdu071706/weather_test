import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_test/model/weather_model.dart';

class WeatherApiClient {



  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoin = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c5ab3577eecfbf963ecd13514779dc27&units=metric");
    var resposne = await http.get(endpoin);
    var body = jsonDecode(resposne.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);
  }
}
