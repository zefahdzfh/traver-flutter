// ignore_for_file: unused_local_variable, file_names, avoid_print

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/model/model.dart';

import "package:http/http.dart" as http;
import 'package:travel_app/widget/popular.dart';

class HomeController {
  Future getKategori() async {
    Future.delayed(Duration(seconds: 3));
    String url = "${dotenv.env['IP']}/kategori/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('isLogin').toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.get(urlData, headers: {"Authorization": token});

    if (respon.statusCode == 200) {
      Kategori data = kategoriFromJson(respon.body);
      return data.data;
    } else {
      return null;
    }

    // return "abc";
  }

  Future getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('isLogin').toString());
    return dataUser.data.nama;
  }

  Future getPopular() async {
    Future.delayed(Duration(seconds: 3));
    String url = "${dotenv.env['IP']}/wisata/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('isLogin').toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.get(urlData, headers: {"Authorization": token});

    if (respon.statusCode == 200) {
      Wisata data = wisataFromJson(respon.body);
      return data.data;
    } else {
      return null;
    }

    // return "abc";
  }

  Future getFavorit() async {
    String url = "${dotenv.env['IP']}/wisata/list?favorit=true";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('isLogin').toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.get(urlData, headers: {"Authorization": token});

    if (respon.statusCode == 200) {
      Wisata data = wisataFromJson(respon.body);
      return data.data;
    } else {
      return null;
    }

    // return "abc";
  }
}
