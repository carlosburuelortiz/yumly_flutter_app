class GenericException implements Exception {
  final String? message;
  final int? statusCode;

  GenericException({this.message = 'Something went wrong', this.statusCode});

  @override
  String toString() {
    return 'message: $message, statusCode: $statusCode';
  }
}
