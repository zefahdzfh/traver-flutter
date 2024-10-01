// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

part of "model.dart";

// Fungsi untuk mengubah JSON menjadi objek Kategori
Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

// Fungsi untuk mengubah objek Kategori menjadi JSON
String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  String status;
  String message;
  int count;
  List<DataKategori> data;
  Pagination pagination;

  // Constructor dari Kategori
  Kategori({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
    required this.pagination,
  });

  // Factory method untuk mengubah JSON menjadi objek Kategori
  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        // Parsing list data kategori dari JSON
        data: List<DataKategori>.from(
            json["data"].map((x) => DataKategori.fromJson(x))),
        // Parsing pagination dari JSON
        pagination: Pagination.fromJson(json["pagination"]),
      );

  // Method untuk mengubah objek Kategori menjadi JSON
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        // Konversi list data kategori menjadi JSON
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        // Konversi pagination menjadi JSON
        "pagination": pagination.toJson(),
      };
}

class DataKategori {
  int id;
  String namaKategori;
  String gambarKategori;
  CreatedBy createdBy;
  CreatedBy? updatedBy; // Nullable, bisa bernilai null

  // Constructor dari DataKategori
  DataKategori({
    required this.id,
    required this.namaKategori,
    required this.gambarKategori,
    required this.createdBy,
    this.updatedBy, // Nullable, bisa null
  });

  // Factory method untuk mengubah JSON menjadi objek DataKategori
  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        gambarKategori: json["gambar_kategori"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        // Jika updatedBy ada, parsing, jika tidak null
        updatedBy: json["updated_by"] != null
            ? CreatedBy.fromJson(json["updated_by"])
            : null,
      );

  // Method untuk mengubah objek DataKategori menjadi JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "gambar_kategori": gambarKategori,
        "created_by": createdBy.toJson(),
        // Jika updatedBy tidak null, ubah menjadi JSON, jika tidak biarkan null
        "updated_by": updatedBy?.toJson(),
      };
}

class CreatedBy {
  int id;
  String nama;

  // Constructor dari CreatedBy
  CreatedBy({
    required this.id,
    required this.nama,
  });

  // Factory method untuk mengubah JSON menjadi objek CreatedBy
  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        nama: json["nama"],
      );

  // Method untuk mengubah objek CreatedBy menjadi JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}

class Pagination {
  int page;
  int pageSize;

  // Constructor dari Pagination
  Pagination({
    required this.page,
    required this.pageSize,
  });

  // Factory method untuk mengubah JSON menjadi objek Pagination
  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
      );

  // Method untuk mengubah objek Pagination menjadi JSON
  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
      };
}
