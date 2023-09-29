import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:structure_lesson/modules/weather/domain/entity/weather_item.dart';
import 'package:structure_lesson/modules/weather/domain/usecase/get_weather.dart';
import 'package:structure_lesson/utils/enum.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeather;

  WeatherBloc(this.getWeather) : super(const WeatherState(errorText: '')) {
    on<WeatherEvent>((event, emit) async {
      emit(state.copyWith(status: ActionStatus.isLoading));
      final result = await getWeather('');
      if (result.isRight) {
        var list = result.right;
        emit(state.copyWith(list: list, status: ActionStatus.isSuccess));
      } else {
        var messageModel = result.left;
        emit(state.copyWith(
          errorText: messageModel.message,
          status: ActionStatus.isFailure,
        ));
      }
    });
  }
}
