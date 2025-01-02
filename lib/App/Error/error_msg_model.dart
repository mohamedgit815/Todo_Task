class ErrorModel {
  final String msg;

  ErrorModel({required this.msg});

  factory ErrorModel.fromJson(Map<String,dynamic> json) {
    return ErrorModel(
        msg: json['message']
    );
  }
}