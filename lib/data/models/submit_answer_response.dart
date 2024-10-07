class SubmitAnswerResponse {
  final String? status;
  final String? message;
  final dynamic data;
  final String? errorCode;

  SubmitAnswerResponse({
    this.status,
    this.message,
    this.data,
    this.errorCode,
  });

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) {
    return SubmitAnswerResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'],
      errorCode: json['errorCode'] as String?,
    );
  }

  @override
  String toString() {
    return 'SubmitAnswerResponse(status: $status, message: $message, data: $data, errorCode: $errorCode)';
  }
}