import 'package:get/get_connect.dart';

class RestException implements Exception {
  final String? message;
  final int? statusCode;
  final Response? response;

  RestException({
    this.message,
    this.statusCode,
    this.response,
  });

  @override
  String toString() => ' $message';
}
