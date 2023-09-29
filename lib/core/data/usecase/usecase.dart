import 'package:equatable/equatable.dart';

import 'package:structure_lesson/core/data/errors/failures.dart';
import 'package:structure_lesson/utils/either.dart';




abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
