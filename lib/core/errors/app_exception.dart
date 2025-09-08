abstract class AppException implements Exception {
  final String message;

  const AppException([this.message="An unexpected error occurred"]);

  @override
  String toString() => message;
}
