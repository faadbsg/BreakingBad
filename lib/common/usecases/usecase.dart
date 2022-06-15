import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UsesCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params p);
}
