// To parse this JSON data, do
//
//     final wisata = wisataFromJson(jsonString);

part of 'model.dart';

Wisata wisataFromJson(String str) => Wisata.fromJson(json.decode(str));

String wisataToJson(Wisata data) => json.encode(data.toJson());

class Wisata {
    String status;
    String message;
    List<DataWisata> data;

    Wisata({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        status: json["status"],
        message: json["message"],
        data: List<DataWisata>.from(json["data"].map((x) => DataWisata.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataWisata {
    int id;
    String namaWisata;
    String gambarWisata;
    String lokasiWisata;
    int ratingWisata;
    String deskripsiWisata;
    int hargaWisata;
    KategoriId kategoriId;
    bool favorit;

    DataWisata({
        required this.id,
        required this.namaWisata,
        required this.gambarWisata,
        required this.lokasiWisata,
        required this.ratingWisata,
        required this.deskripsiWisata,
        required this.hargaWisata,
        required this.kategoriId,
        required this.favorit,
    });

    factory DataWisata.fromJson(Map<String, dynamic> json) => DataWisata(
        id: json["id"],
        namaWisata: json["nama_wisata"],
        gambarWisata: json["gambar_wisata"],
        lokasiWisata: json["lokasi_wisata"],
        ratingWisata: json["rating_wisata"],
        deskripsiWisata: json["deskripsi_wisata"],
        hargaWisata: json["harga_wisata"],
        kategoriId: KategoriId.fromJson(json["kategori_id"]),
        favorit: json["favorit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_wisata": namaWisata,
        "gambar_wisata": gambarWisata,
        "lokasi_wisata": lokasiWisata,
        "rating_wisata": ratingWisata,
        "deskripsi_wisata": deskripsiWisata,
        "harga_wisata": hargaWisata,
        "kategori_id": kategoriId.toJson(),
        "favorit": favorit,
    };
}

class KategoriId {
    int id;
    String namaKategori;

    KategoriId({
        required this.id,
        required this.namaKategori,
    });

    factory KategoriId.fromJson(Map<String, dynamic> json) => KategoriId(
        id: json["id"],
        namaKategori: json["nama_kategori"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
    };
}
