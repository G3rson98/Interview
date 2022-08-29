import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Mascota mascotaFromJson(String str) => Mascota.fromJson(json.decode(str));

String mascotaToJson(Mascota data) => json.encode(data.toJson());

class Mascota {
  final String name;
  final double lat;
  final double lon;
  final XFile? image;
  final String? encodedImage;

  Mascota({
    required this.name,
    required this.lat,
    required this.lon,
    this.image,
    this.encodedImage,
  });

  Mascota copyWith({
    String? name,
    double? lat,
    double? lon,
  }) =>
      Mascota(
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );

  factory Mascota.fromJson(Map<String, dynamic> json) {

    return Mascota(
      name: json["name"],
      lat: json["lat"].toDouble(),
      lon: json["lon"].toDouble(),
      encodedImage: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "lon": lon,
        "image": image != null ? imageEncode() : null,
      };

  imageEncode() {
    List<int> imageBytes = File(image!.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  XFile imageDecode(dynamic bytes) {
    return XFile.fromData(base64.decode(bytes));
  }
}
