
class ApiResult<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  ApiResult._({this.data, this.errorMessage, required this.isSuccess});

  factory ApiResult.success(T data) => ApiResult._(data: data, isSuccess: true);
  factory ApiResult.failure(String message) => ApiResult._(errorMessage: message, isSuccess: false);
}

