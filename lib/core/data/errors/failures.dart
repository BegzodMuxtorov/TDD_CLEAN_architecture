

import 'package:equatable/equatable.dart';

 class Failure extends Equatable {

  final String message;

const Failure({this.message=''});

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  final String code;
  final int sec;

  ServerFailure({this.message = '', this.code = '', this.sec = 0}):super(message: message);
}

class CacheFailure extends Failure {}

class ContactsAccessFailure extends Failure {}
