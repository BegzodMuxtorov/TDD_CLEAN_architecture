import 'package:structure_lesson/core/data/errors/failures.dart';
import 'package:structure_lesson/modules/weather/data/model/weather_item.dart';
import 'package:structure_lesson/modules/weather/data/source/network_source.dart';
import 'package:structure_lesson/modules/weather/domain/repository/weather.dart';
import 'package:structure_lesson/utils/either.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherSource data = WeatherNetworkSource();

  @override
  Future<Either<Failure, List<WeatherItemModel>>> getWeather() {

    return data.getWeatherList();

  }
}
