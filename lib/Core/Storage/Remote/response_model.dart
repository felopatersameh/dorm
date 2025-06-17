
class ResponseModel {
  final String message;
  final bool status;
  final dynamic data;

  ResponseModel({
    required this.message,
    required this.status,
    this.data,
  });

  factory ResponseModel.success({String message = 'Success', dynamic data}) {
    return ResponseModel(message: message, status: true, data: data);
  }

  factory ResponseModel.error({String message = 'Error', dynamic data, }) {
    return ResponseModel(message: message, status: false, data: data, );
  }

  @override
  String toString() {
    return 'ResponseModel{message: $message, status: $status, data: $data, }';
  }

  ResponseModel copyWith({
    String? message,
    bool? status,
    dynamic data,
  }) {
    return ResponseModel(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}


class FailureModel {
  final String message;
  final dynamic error; 

  FailureModel({required this.message, this.error});

  @override
  String toString() {
    return 'FailureModel{message: $message, error: $error}';
  }
}