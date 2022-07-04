import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_bloc/core/exception/network_exception.dart';
import 'package:weather_bloc/feature/weather_search/data/model/weather_model.dart';
import 'package:weather_bloc/feature/weather_search/domain/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _repository;

  WeatherBloc(this._repository) : super(const WeatherInitial());

  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      try {
        yield (const WeatherLoading());
        final weather = await _repository.fetchWeather(event.city);
        yield (WeatherLoaded(weather));
      } on NetworkException {
        yield (const WeatherError('Erro na requisição'));
      }
    }
  }
}
