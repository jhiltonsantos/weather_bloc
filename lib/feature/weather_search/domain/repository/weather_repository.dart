import 'package:weather_bloc/feature/weather_search/data/model/weather_model.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<WeatherModel> fetchWeather(String cityName);
}
