class ThingExists implements Exception {
  final String message;

  ThingExists(this.message);

  @override
  String toString() {
    return 'MyCustomException: $message';
  }
}

class ThingExistsNot implements Exception {
  final String message;

  ThingExistsNot(this.message);

  @override
  String toString() {
    return 'MyCustomException: $message';
  }
}