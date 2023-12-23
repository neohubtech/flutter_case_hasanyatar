import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';

/// `MovieErrorHandler` is a class that implements the `ErrorMessageHandler` interface
/// and is responsible for returning custom error messages.
///

class ErrorResponse<T extends Exception> {
  ErrorResponse(this.message, {required this.exception});
  final String message;
  final T exception;
}

class MovieErrorHandler implements ErrorMessageHandler {
  MovieErrorHandler._();
  static final shared = MovieErrorHandler._();

  /// Determines the error message based on the type of exception.
  @override
  ErrorResponse getErrorMessage(Exception exception) =>
      switch (exception.runtimeType) {
        DioException => _handleDioException(exception as DioException),
        // Add more error handlers here.
        _ => ErrorResponse('Unknown error', exception: exception),
      };

  /// Handles DioException errors and returns the appropriate error message.
  ErrorResponse<DioException> _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioException.connectionTimeout:
        return ErrorResponse<DioException>(
          'Connection timeout',
          exception: exception,
        );
      case DioExceptionType.connectionError:
        return ErrorResponse<DioException>(
          'Connection error',
          exception: exception,
        );

      case DioException.sendTimeout:
        return ErrorResponse<DioException>(
          'Send timeout',
          exception: exception,
        );

      case DioException.receiveTimeout:
        return ErrorResponse<DioException>(
          'Receive timeout',
          exception: exception,
        );

      case DioException.badResponse:
        // Added a more informative error message for response errors.
        if (exception.response?.statusCode == 404) {
          return ErrorResponse<DioException>(
            'Not found',
            exception: exception,
          );
        } else {
          return ErrorResponse<DioException>(
            'Bad response',
            exception: exception,
          );
        }

      case DioException.requestCancelled:
        return ErrorResponse<DioException>(
          'Request cancelled',
          exception: exception,
        );

      default:
        return ErrorResponse<DioException>(
          'Unknown error',
          exception: exception,
        );
    }
  }

  @override
  ErrorResponse<Exception> defaultErrorMessage() {
    return ErrorResponse('Bilinmeyen bir hata oluştu.', exception: Exception());
  }
}
