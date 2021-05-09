// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

List<AlbumModel> albumFromJson(String str) => List<AlbumModel>.from(json.decode(str).map((x) => AlbumModel.fromJson(x)));

String albumToJson(List<AlbumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}