import 'package:structure_lesson/core/data/errors/failures.dart';
import 'package:structure_lesson/modules/weather/data/model/weather_item.dart';
import 'package:structure_lesson/utils/either.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<WeatherItemModel>>> getWeather();





}
