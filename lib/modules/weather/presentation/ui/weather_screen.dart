import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure_lesson/modules/weather/data/repository/weather_impl.dart';
import 'package:structure_lesson/modules/weather/domain/usecase/get_weather.dart';
import 'package:structure_lesson/modules/weather/presentation/bloc/weather_bloc.dart';
import 'package:structure_lesson/utils/enum.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = WeatherBloc(GetWeatherUseCase(
        repo: RepositoryProvider.of<WeatherRepositoryImpl>(context)))
      ..add(GetWeather());

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: weatherBloc,
        child: BlocListener<WeatherBloc, WeatherState>(
          listenWhen: (state1, state2) {
            return state2.status == ActionStatus.isFailure;
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          },
          child: Scaffold(
            body: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.status == ActionStatus.isLoading) {
                  if (Platform.isAndroid) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                } else if (state.status == ActionStatus.isSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (c, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.list[index].first_name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Text(
                                  state.list[index].email,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(
                    child: Text('Error`'),
                  );
                }
              },
            ),
          ),
        ),
      );
}
