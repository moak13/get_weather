import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

// This is a contract abstraction class which allows for implementaion in the domain layer
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
