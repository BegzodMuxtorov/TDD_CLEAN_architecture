part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final List<WeatherItemEntity> list;

  final ActionStatus status;
  final String errorText;

  const WeatherState(
      {this.status = ActionStatus.pure,
      this.list = const [],
      required this.errorText});

  WeatherState copyWith({
    List<WeatherItemEntity>? list,
    ActionStatus? status,
    String? errorText,
  }) {
    return WeatherState(
      errorText: errorText ?? this.errorText,
      list: list ?? this.list,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [list, status];
}
