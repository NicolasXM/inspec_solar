abstract class ErrorSearch implements Exception {}

class InvalidTextError implements ErrorSearch {}

class DataSourceError implements ErrorSearch {
  final String message;

  DataSourceError(this.message);
}


