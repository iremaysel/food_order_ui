class ServerExeption implements Exception {}

class UnauthorizedExeption implements Exception {}

class CacheExeption implements Exception {}

class NoInternetExeption implements Exception {}

class BadRequestExeption implements Exception {
  final String message;

  BadRequestExeption(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}
