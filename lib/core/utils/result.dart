class Result<T> {
  final T success;
  final Error error;
  Result({
    this.success,
    this.error,
  });
}

class Success<T> extends Result {
  final T data;
  Success({this.data});
}

class Error extends Result {
  final String message;
  Error({
    this.message,
  });

  @override
  String toString() {
    return message;
  }
}
