class Weather {
  String? cityName;//означает  имя города.
  var temp;//означает температура.
  var wind; //означает ветер.
  int? humidity; //означает влажность.
  double? feels_like;//означает как будто.
  int? pressure;//означает давление.

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}
