/// Class for all the exceptions that might occur during the API call
// coverage:ignore-file
class AppException implements Exception {
  AppException([this._message, this._prefix]);
  final String? _message;
  final String? _prefix;
  @override
  String toString() => '$_prefix$_message';
}
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised: ');
}
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}