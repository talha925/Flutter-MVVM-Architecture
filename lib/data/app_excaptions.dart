class AppException implements Exception {
  final message; // Instance variable to store the exception message/
  final prefix; // Instance variable to store the exception prefix

  AppException(
    this.message,
    this.prefix,
  );

  String toString() {
    return "$message$prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message,
            "Error during communication"); // Call the superclass constructor with the message and prefix
}

class BadReqestException extends AppException {
  BadReqestException([String? message])
      : super(message,
            "Invalid request"); // Call the superclass constructor with the message and prefix
}

class UnathorisedException extends AppException {
  UnathorisedException([String? message])
      : super(message,
            "Unathorised request"); // Call the superclass constructor with the message and prefix
}
