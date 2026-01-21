import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    if (statusCode != null) {
      if (data is Map<String, dynamic> && data['message'] != null) {
        return ApiError(
          message: data['message'].toString(),
          statusCode: statusCode,
        );
      }

      switch (statusCode) {
        case 400:
          return ApiError(message: 'Bad request', statusCode: 400);

        case 401:
          return ApiError(message: 'Unauthorized. Please login again', statusCode: 401);

        case 403:
          return ApiError(message: 'Access denied', statusCode: 403);

        case 404:
          return ApiError(message: 'Resource not found', statusCode: 404);

        case 409:
          return ApiError(message: 'Conflict occurred', statusCode: 409);

        case 422:
          return ApiError(message: 'Validation error', statusCode: 422);

        case 302:
          return ApiError(message: 'This email is already taken', statusCode: 302);

        case 500:
          return ApiError(message: 'Internal server error', statusCode: 500);

        default:
          return ApiError(
            message: 'Unexpected error (Status code: $statusCode)',
            statusCode: statusCode,
          );
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout. Please check your internet');

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Request timeout. Please try again');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Response timeout. Please try again');

      case DioExceptionType.badResponse:
        return ApiError(message: 'Invalid response from server');

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled');

      case DioExceptionType.connectionError:
        return ApiError(message: 'No internet connection');

      case DioExceptionType.unknown:
      default:
        return ApiError(message: 'An unexpected error occurred');
    }
  }
}
