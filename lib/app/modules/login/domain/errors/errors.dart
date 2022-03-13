abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({required this.message});
}

class ErrorLoginEmail extends Failure {
  final String message;
  ErrorLoginEmail({required this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({required this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({required this.message});
}

class ErrorLoginPhone implements Failure {
  final String message;
  ErrorLoginPhone({required this.message});
}

class NotAutomaticRetrieved implements Failure {
  final String verificationId;
  final String message;
  NotAutomaticRetrieved(this.verificationId, {required this.message});
}

class InternalError implements Failure {
  final String message;
  InternalError({required this.message});
}
