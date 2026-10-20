class ApiResponse<T> {
  final bool success;
  final T? data;
  final Error? error;

  ApiResponse({required this.success, this.data, this.error});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : fromJsonT(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>,)
    );
  }
}

class Error{
  final String? code;
  final String? message;

  Error({this.code, this.message});

  factory Error.fromJson(
      Map<String, dynamic> json,
  ){
    return Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );
  }
}