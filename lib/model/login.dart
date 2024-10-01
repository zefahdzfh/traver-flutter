// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

part of 'model.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    String status;
    String message;
    Data data;

    Login({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String nama;
    String email;
    String password;
    String refreshToken;
    String accessToken;

    Data({
        required this.id,
        required this.nama,
        required this.email,
        required this.password,
        required this.refreshToken,
        required this.accessToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        refreshToken: json["refresh_token"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "password": password,
        "refresh_token": refreshToken,
        "access_token": accessToken,
    };
}
