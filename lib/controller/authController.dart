import "dart:convert";
import "dart:developer";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:travel_app/model/model.dart";
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future registerProses(
      String nama, String email, String password, String konfirmasi) async {
    String url = "${dotenv.env['IP']}/auth/register";
    Uri urlData = Uri.parse(url);

    Map data = {
      "nama": nama,
      "email": email,
      "password": password,
      "konfirmasiPassword": konfirmasi
    };

    var body = json.encode(data);

    final respon = await http.post(urlData,
        headers: {"Content-Type": "application/json"}, body: body);

    if (respon.statusCode == 201) {
      Register dataRes = registerFromJson(respon.body.toString());
      return dataRes;
    } else {
      return null;
    }
  }

  Future loginProses(String email, String password) async {
    String url = "${dotenv.env['IP']}/auth/login";
    Uri urlData = Uri.parse(url);

    Map data = {
      "email": email,
      "password": password,
    };

    var body = json.encode(data);

    final respon = await http.post(urlData,
        headers: {"Content-Type": "application/json"}, body: body);

    if (respon.statusCode == 201) {
      final dataRes = loginFromJson(respon.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('isLogin', respon.body);
      return dataRes;
    } else {
      return null;
    }
  }

  Future forgotProses(String email) async {
    String url = "${dotenv.env['IP']}/auth/lupa-password";
    Uri urlData = Uri.parse(url);

    Map data = {
      "email": email,
    };

    var body = json.encode(data);

    final respon = await http.post(urlData,
        headers: {"Content-Type": "application/json"}, body: body);

    if (respon.statusCode == 201) {
      log(respon.body);
      ForgotPw dataRes = forgotPwFromJson(respon.body.toString());
      return dataRes;
    } else {
      return null;
    }
  }
}
