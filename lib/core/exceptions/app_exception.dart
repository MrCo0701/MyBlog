abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class NetworkException extends AppException {
  NetworkException() : super("Error networking");
}

class ConflictException extends AppException {
  ConflictException() : super("Email already exists");
}

class ServerException extends AppException {
  ServerException() : super("Error server");
}

class UnknownException extends AppException {
  UnknownException() : super("Unspecified error");
}