part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

@immutable
class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

@immutable
class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

@immutable
class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

@immutable
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
