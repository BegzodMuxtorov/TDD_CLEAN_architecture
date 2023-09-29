import 'package:flutter/cupertino.dart';
import 'package:structure_lesson/core/data/errors/failures.dart';
import 'package:structure_lesson/core/singleton/dio.dart';
import 'package:structure_lesson/core/singleton/service_locator.dart';
import 'package:structure_lesson/modules/weather/data/model/weather_item.dart';
import 'package:structure_lesson/utils/either.dart';

abstract class WeatherSource {
  Future<Either<Failure, List<WeatherItemModel>>> getWeatherList();
}

class WeatherNetworkSource implements WeatherSource {
  final dio = serviceLocator<DioSettings>().dio;
  //String tempToken = '1a3976601f015d4ed6a31c5454b4935c';

  @override
  Future<Either<Failure, List<WeatherItemModel>>> getWeatherList() async {
    try {
      final result = await dio
          .get('https://reqres.in/api/users?page=2');

      debugPrint(result.realUri.toString());
      debugPrint(result.data.toString());

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        var list = (result.data['data'] as List<dynamic>)
            .map((e) => WeatherItemModel.fromJson(e))
            .toList();

        return Right(list);
      } else {
        return Left(ServerFailure(message: result.data['message']));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Parsing error'));
    }
  }
}

// class WeatherLocalSource implements WeatherSource {
//
//
// }
