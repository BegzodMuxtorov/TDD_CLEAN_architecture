import 'package:structure_lesson/modules/weather/domain/entity/weather_item.dart';

class WeatherItemModel extends WeatherItemEntity {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  WeatherItemModel(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.avatar,
      required this.last_name})
      : super(first_name: first_name, email: email);

  factory WeatherItemModel.fromJson(Map<String, dynamic> json) {
    return WeatherItemModel(
        id: json['id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json ['avatar']);
  }
}
