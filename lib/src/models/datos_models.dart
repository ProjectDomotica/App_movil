// To parse this JSON data, do
//
//     final datos = datosFromJson(jsonString);

import 'dart:convert';

List<Datos> datosFromJson(String str) =>
    List<Datos>.from(json.decode(str).map((x) => Datos.fromJson(x)));

String datosToJson(List<Datos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datos {
  Datos({
    required this.id,
    required this.message,
  });

  final String id;
  final String message;

  factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        id: json["_id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "message": message,
      };
}
