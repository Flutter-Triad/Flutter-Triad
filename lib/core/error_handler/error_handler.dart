import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../resources/manager_strings.dart';

class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

class ErrorHandler implements Exception {
  late Failure failure;
  AppSettingsPrefs _appSettings = instance<AppSettingsPrefs>();

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      final response = error.response;
      final statusCode = response?.statusCode ?? ResponseCode.BAD_REQUEST;
      final data = response?.data;

      if (response?.statusCode == ResponseCode.UNAUTHORISED) {
        Future.delayed(
          const Duration(
            seconds: Constants.sessionFinishedDuration,
          ),
          () {
            _appSettings.removeCachedUserData();
            Get.offAllNamed(Routes.login);
          },
        );
        failure = Failure(
          response!.statusCode.onNull(),
          ManagerStrings.sessionFinished,
        );
      } else if (data != null) {
        final errorMessage = data[Constants.message] ??
            data[Constants.error]?[Constants.message] ??
            data[Constants.errors].values.first.first ??
            Constants.error;

        failure = Failure(
          statusCode,
          errorMessage,
        );
      } else {
        failure = Failure(
          statusCode,
          Constants.error,
        );
      }
    } else {
      failure = TypeHandler.UNKNOWN.getFailure();
    }
  }
}

enum TypeHandler {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN
}

extension DataSourceExtension on TypeHandler {
  Failure getFailure() {
    switch (this) {
      case TypeHandler.SUCCESS:
        return Failure(
          ResponseCode.SUCCESS,
          ManagerStrings.SUCCESS,
        );
      case TypeHandler.NO_CONTENT:
        return Failure(
          ResponseCode.NO_CONTENT,
          ManagerStrings.NO_CONTENT,
        );
      case TypeHandler.BAD_REQUEST:
        return Failure(
          ResponseCode.BAD_REQUEST,
          ManagerStrings.BAD_REQUEST,
        );
      case TypeHandler.FORBIDDEN:
        return Failure(
          ResponseCode.FORBIDDEN,
          ManagerStrings.FORBIDDEN,
        );
      case TypeHandler.UNAUTHORISED:
        Get.offAllNamed(
          Routes.login,
        );
        return Failure(
          ResponseCode.UNAUTHORISED,
          ManagerStrings.UNAUTHORISED,
        );
      case TypeHandler.NOT_FOUND:
        return Failure(
          ResponseCode.NOT_FOUND,
          ManagerStrings.NOT_FOUND,
        );
      case TypeHandler.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ManagerStrings.INTERNAL_SERVER_ERROR,
        );
      case TypeHandler.CONNECT_TIMEOUT:
        return Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ManagerStrings.CONNECT_TIMEOUT,
        );
      case TypeHandler.CANCEL:
        return Failure(
          ResponseCode.CANCEL,
          ManagerStrings.CANCEL,
        );
      case TypeHandler.RECEIVE_TIMEOUT:
        return Failure(
          ResponseCode.RECEIVE_TIMEOUT,
          ManagerStrings.RECIEVE_TIMEOUT,
        );
      case TypeHandler.SEND_TIMEOUT:
        return Failure(
          ResponseCode.SEND_TIMEOUT,
          ManagerStrings.SEND_TIMEOUT,
        );
      case TypeHandler.CACHE_ERROR:
        return Failure(
          ResponseCode.CACHE_ERROR,
          ManagerStrings.CACHE_ERROR,
        );
      case TypeHandler.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION,
        );
      default:
        return Failure(
          ResponseCode.UNKNOWN,
          ManagerStrings.UNKNOWN,
        );
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200;

  static const int NO_CONTENT = 201;

  static const int BAD_REQUEST = 400;

  static const int FORBIDDEN = 403;

  static const int UNAUTHORISED = 401;

  static const int NOT_FOUND = 404;

  static const int UNVERIFIED_USER = 423;

  static const int INTERNAL_SERVER_ERROR = 500;

  static const int CONNECT_TIMEOUT = -1;

  static const int CANCEL = -2;

  static const int RECEIVE_TIMEOUT = -3;

  static const int SEND_TIMEOUT = -4;

  static const int CACHE_ERROR = -5;

  static const int NO_INTERNET_CONNECTION = -6;

  static const int UNKNOWN = -7;
}
