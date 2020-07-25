import 'package:equatable/equatable.dart';

// This class handles failures that tends to occur during application process
abstract class Failure extends Equatable {
  Failure([List props = const <dynamic>[]]) : super();
}

// Handles all server error messages
class ServerError extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}

// Handles all cache error messages
class CacheError extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}
