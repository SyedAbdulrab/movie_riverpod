import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:movie_riverpod/models/movie_model.dart';

class ApiServices {
  final String endpoint =
      'https://api.themoviedb.org/3/trending/movie/week?language=en-US';

  final apiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmU2ODExYWJhNzUwNTY1MWI2YzdlZWNhNDgzZGIyMiIsInN1YiI6IjY1NzQyZjQwNjZmMmQyMDExYmVjMWIxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OORC5IfUdG7UdDpXy9d_WXg6xxpz7MnvIJa33-k3bUo";

  Future<List<MovieModel>> getTrendingMovies() async {
    final Uri uri = Uri.parse(endpoint);
    final Map<String, String> headers = {
      'Authorization': 'Bearer $apiKey',
      'accept': 'application/json',
    };

    final Response response = await get(uri, headers: headers);


    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)["results"];
      return result.map((e)=>MovieModel.fromJson(e)).toList();
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final movieProvider = Provider<ApiServices>((ref) => ApiServices());
