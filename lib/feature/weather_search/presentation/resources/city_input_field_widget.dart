import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/feature/weather_search/presentation/cubit/weather_cubit.dart';

class CityInputFieldWidget extends StatelessWidget {
  const CityInputFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Insira uma cidade",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName);
    //final weatherBloc = context.read<WeatherBloc>();
    // weatherBloc.add(GetWeather(cityName));
  }
}
