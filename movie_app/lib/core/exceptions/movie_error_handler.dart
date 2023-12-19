import 'package:dio/dio.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';

/// `MovieErrorHandler` is a class that implements the `ErrorMessageHandler` interface
/// and is responsible for returning custom error messages.
class MovieErrorHandler implements ErrorMessageHandler {
  MovieErrorHandler._();
  static final shared = MovieErrorHandler._();

  /// Determines the error message based on the type of exception.
  @override
  String getErrorMessage(dynamic exception) {
    switch (exception.runtimeType) {
      case DioException:
        return _handleDioException(exception as DioException);
      // Add more exception cases here if needed.
      default:
        return _handleDefaultException(exception);
    }
  }

  /// Handles DioException errors and returns the appropriate error message.
  String _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioException.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.connectionError:
        return 'Connection error';

      case DioException.sendTimeout:
        return 'Send timeout';

      case DioException.receiveTimeout:
        return 'Receive timeout';

      case DioException.badResponse:
        // Added a more informative error message for response errors.
        if (exception.response?.statusCode == 404) {
          return 'Resource not found';
        } else {
          return 'Unexpected error occurred';
        }

      case DioException.requestCancelled:
        return 'Request canceled';

      default:
        return 'Unexpected error occurred';
    }
  }

  /// Handles non-DioException errors and returns a general error message.
  String _handleDefaultException(dynamic exception) {
    // Optionally, you can perform custom handling here.
    return 'An unexpected error occurred';
  }
}
