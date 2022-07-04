import 'dart:math';

import 'package:weather_bloc/core/exception/network_exception.dart';
import 'package:weather_bloc/feature/weather_search/data/model/weather_model.dart';
import 'package:weather_bloc/feature/weather_search/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel> fetchWeather(String cityName) async {
    return Future.delayed(const Duration(seconds: 1), () {
      final random = Random();

      if (random.nextBool()) {
        throw NetworkException();
      }

      return WeatherModel(
        cityName: cityName,
        temperature: 20 + random.nextInt(15) + random.nextDouble(),
      );
    });
  }
}
