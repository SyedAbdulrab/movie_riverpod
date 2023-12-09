import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/services/api_services.dart';

final trendingMovieProvider = FutureProvider((ref) async{
  return ref.watch(movieProvider).getTrendingMovies();
});