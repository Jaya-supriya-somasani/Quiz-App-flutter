class SubmitAnswerResponse{
  final String? status;
  final String? message;
  final dynamic data;
  final String? errorCode;
  SubmitAnswerResponse({this.data, this.message, this.status, this.errorCode,});

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) {
    return SubmitAnswerResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
      errorCode: json['errorCode'],
    );
  }
}