import 'package:my_movie_app/domain/entities/Movie.dart';

abstract class MovieRepository{
  Future<List<Movie>>getTrendingMovies();
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getPopularMovies();
}