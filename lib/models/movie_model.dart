import 'package:flutter/material.dart';

class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json['title'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        id: json['id']);
  }
}
