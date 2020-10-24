import 'dart:convert';

// This abstact class is the base implementation of exception
abstract class AppException implements Exception {}

// This class handles all server request exceptions that occur
class ServerException extends AppException {
  final String message;
  ServerException({
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory ServerException.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ServerException(
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServerException.fromJson(String source) =>
      ServerException.fromMap(json.decode(source));
}

// This class handles all cache request exceptions that occur
class CacheException extends AppException {}
