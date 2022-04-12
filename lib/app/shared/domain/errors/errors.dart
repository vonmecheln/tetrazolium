abstract class FailureAnalysis implements Exception {
  String get message;
}

class EmptyList extends FailureAnalysis {
  final String message;
  EmptyList({required this.message});
  @override
  String toString() {
    return message;
  }
}

class InvalidIdUser extends FailureAnalysis {
  final String message;
  InvalidIdUser({required this.message});
  @override
  String toString() {
    return message;
  }
}

class ErrorList extends FailureAnalysis {
  final String message;
  ErrorList({required this.message});
  @override
  String toString() {
    return message;
  }
}

class DatasourceResultNull extends FailureAnalysis {
  final String message;
  DatasourceResultNull({required this.message});
  @override
  String toString() {
    return message;
  }
}

class InvalidAnalysis extends FailureAnalysis {
  final String message;
  InvalidAnalysis({required this.message});
  @override
  String toString() {
    return message;
  }
}

class DatasourceError extends FailureAnalysis {
  final String message;
  DatasourceError({required this.message});
  @override
  String toString() {
    return message;
  }
}
