abstract class FailureAnalysis implements Exception {
  // String get message;
}

class EmptyList extends FailureAnalysis {}

class InvalidIdUser extends FailureAnalysis {}

class ErrorList extends FailureAnalysis {}

class DatasourceResultNull extends FailureAnalysis {}

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
