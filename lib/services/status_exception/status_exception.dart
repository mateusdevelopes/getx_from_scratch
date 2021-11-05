import 'package:getx_from_scratch/services/rest_exception.dart';
import 'package:getx_from_scratch/services/status_exception/errors_string.dart';

class StatusException {
  RestException build(int statusCode, ErrosString erros) {
    switch (statusCode) {
      case 204:
        return throw RestException(
            message: erros.code_204 ?? erros.messageDefault,
            statusCode: statusCode);
      case 304:
        return throw RestException(
            message: erros.code_304 ?? erros.messageDefault,
            statusCode: statusCode);
      case 400:
        return throw RestException(
            message: erros.code_400 ?? erros.messageDefault,
            statusCode: statusCode);
      case 401:
        return throw RestException(
            message: erros.code_401 ?? erros.messageDefault,
            statusCode: statusCode);
      case 403:
        return throw RestException(
            message: erros.code_403 ?? erros.messageDefault,
            statusCode: statusCode);
      case 404:
        return throw RestException(
            message: erros.code_404 ?? erros.messageDefault,
            statusCode: statusCode);
      case 405:
        return throw RestException(
            message: erros.code_405 ?? erros.messageDefault,
            statusCode: statusCode);
      case 406:
        return throw RestException(
            message: erros.code_406 ?? erros.messageDefault,
            statusCode: statusCode);
      case 500:
        return throw RestException(
            message: erros.code_500 ?? erros.messageDefault,
            statusCode: statusCode);
      default:
        return throw RestException(message: erros.messageDefault);
    }
  }
}
