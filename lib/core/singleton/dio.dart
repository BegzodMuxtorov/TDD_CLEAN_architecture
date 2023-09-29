import 'package:dio/dio.dart';



class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://api.openweathermap.org',
    connectTimeout: Duration(seconds: 35),
    receiveTimeout: Duration(seconds: 33),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': 'uz'
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: 'https://api.openweathermap.org',
      connectTimeout: Duration(seconds: 35),
      receiveTimeout: Duration(seconds: 33),
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }
  // final _dio = serviceLocator<DioSettings>().dio; ///sample
  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions);
}
