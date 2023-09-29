import 'package:structure_lesson/core/data/errors/failures.dart';
import 'package:structure_lesson/core/data/usecase/usecase.dart';
import 'package:structure_lesson/modules/weather/domain/entity/weather_item.dart';
import 'package:structure_lesson/modules/weather/domain/repository/weather.dart';
import 'package:structure_lesson/utils/either.dart';

class GetWeatherUseCase
    extends UseCase<List<WeatherItemEntity>, String> {
  final WeatherRepository repo;

  GetWeatherUseCase({required this.repo});

  @override
  Future<Either<Failure, List<WeatherItemEntity>>> call(
      String params) {
    return repo.getWeather();
  }
}

class GetWeatherParam {}
