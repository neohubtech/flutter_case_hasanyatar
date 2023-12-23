import 'package:flutter/material.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';

abstract interface class ErrorMessageHandler {
  ErrorResponse getErrorMessage(Exception exception);

  // except exception use it for default error message
  ErrorResponse defaultErrorMessage();
}
