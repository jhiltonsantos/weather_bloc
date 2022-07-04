import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_bloc/core/exception/network_exception.dart';
import 'package:weather_bloc/feature/weather_search/domain/repository/weather_repository.dart';

import '../../data/model/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(const WeatherInitial());

  Future<void> getWeather(String city) async {
    try {
      emit(const WeatherLoading());
      final weather = await _repository.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError('Erro na requisição'));
    }
  }
}
