// To parse this JSON data, do
//
//     final forgotPw = forgotPwFromJson(jsonString);

part of 'model.dart';

ForgotPw forgotPwFromJson(String str) => ForgotPw.fromJson(json.decode(str));

String forgotPwToJson(ForgotPw data) => json.encode(data.toJson());

class ForgotPw {
    String status;
    String message;
    DataForgot data;

    ForgotPw({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ForgotPw.fromJson(Map<String, dynamic> json) => ForgotPw(
        status: json["status"],
        message: json["message"],
        data: DataForgot.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DataForgot {
    DataForgot();

    factory DataForgot.fromJson(Map<String, dynamic> json) => DataForgot(
    );

    Map<String, dynamic> toJson() => {
    };
}
