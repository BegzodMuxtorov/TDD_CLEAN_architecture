import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure_lesson/core/singleton/service_locator.dart';
import 'package:structure_lesson/modules/weather/data/repository/weather_impl.dart';
import 'package:structure_lesson/modules/weather/presentation/ui/weather_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RepositoryProvider(
      create: (c) => WeatherRepositoryImpl(), child: MaterialApp(
    home: WeatherScreen(),
  ));
}
