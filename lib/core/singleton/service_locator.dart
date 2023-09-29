import 'package:get_it/get_it.dart';
import 'package:structure_lesson/core/singleton/dio.dart';





final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(DioSettings.new);

}
