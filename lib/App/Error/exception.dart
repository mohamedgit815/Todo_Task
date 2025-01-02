import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/error_msg_model.dart';

class ServerException implements Exception {
  final ErrorModel errorMessage;
  final bool local;

  ServerException({required this.errorMessage, this.local = false});
}

class LocalException implements Exception {
  final String msg;
  final bool local;

  LocalException({required this.msg, this.local = true});
}

class BadCertificateException extends ServerException {
  BadCertificateException({required super.errorMessage});
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException({required super.errorMessage});
}

class BadResponseException extends ServerException {
  BadResponseException({required super.errorMessage});
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException({required super.errorMessage});
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException({required super.errorMessage});
}

class SendTimeoutException extends ServerException {
  SendTimeoutException({required super.errorMessage});
}

class UnauthorizedException extends ServerException {
  UnauthorizedException({required super.errorMessage});
}

class ForbiddenException extends ServerException {
  ForbiddenException({required super.errorMessage});
}

class NotFoundException extends ServerException {
  NotFoundException({required super.errorMessage});
}

class CoefficientException extends ServerException {
  CoefficientException({required super.errorMessage});
}

class ErrorFromBackException extends ServerException {
  ErrorFromBackException({required super.errorMessage});
}
class CancelException extends ServerException {
  CancelException({required super.errorMessage});
}

class UnknownException extends ServerException {
  UnknownException({required super.errorMessage});
}

handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(errorMessage: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw BadCertificateException(errorMessage: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(errorMessage: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(errorMessage: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(errorMessage: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request

          throw BadResponseException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 401: //unauthorized
          throw UnauthorizedException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 403: //forbidden
          throw ForbiddenException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 404: //not found
          throw NotFoundException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 409: //coefficient

          throw CoefficientException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 500: //coefficient

          throw ErrorFromBackException(errorMessage: ErrorModel.fromJson(e.response!.data));

        case 504: // Bad request

          throw BadResponseException(errorMessage: ErrorModel(msg: "msg"));
      }

    case DioExceptionType.cancel:
      throw CancelException( errorMessage: ErrorModel(msg: "msg"));

    case DioExceptionType.unknown:
      throw UnknownException( errorMessage: ErrorModel(msg: "msg"));

  //   default:
  //     throw UnknownException( errorMessage: ErrorModel(msg: "msg"));
   }
}