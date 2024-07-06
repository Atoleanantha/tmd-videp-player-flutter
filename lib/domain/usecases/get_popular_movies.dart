import 'package:my_movie_app/domain/repositories/movie_repository.dart';

import '../entities/Movie.dart';

class GetPopularMovies{
  final MovieRepository repository;
  GetPopularMovies(this.repository);

  Future<List<Movie>>call() async{
    return repository.getPopularMovies();
  }
}