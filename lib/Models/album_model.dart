import 'dart:convert';

class AlbumModel{
  final String status , articles;
  final int totalResult;
  final String Image;
  AlbumModel({
      required this.status,
      required this.totalResult,
      required this.articles,
      required this.Image,
  });
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      status: json['status'],
      articles: json['articles'],
      Image:json['urlToImage'],
      totalResult: json['totalResult'],
    );
  }
  
}