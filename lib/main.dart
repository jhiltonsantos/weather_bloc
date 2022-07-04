import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/feature/weather_search/data/repository/weather_repository_impl.dart';
import 'package:weather_bloc/feature/weather_search/presentation/cubit/weather_cubit.dart';
import 'package:weather_bloc/feature/weather_search/presentation/pages/weather_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepositoryImpl()),
        // create: (context) => WeatherBloc(WeatherRepositoryImpl()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
