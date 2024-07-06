import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_movie_app/domain/entities/Movie.dart';
import 'package:my_movie_app/domain/repositories/movie_repository.dart';
import 'package:my_movie_app/domain/usecases/get_trending_movies.dart';

import 'get_popular_movies_test.mocks.dart';

// class MockMovieRepository extends Mock implements MovieRepository{}
@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository=MockMovieRepository();
    usecase =GetTrendingMovies(mockMovieRepository);
  });

  final tMoviesList=[
    Movie(id: 1, title: "test movie", overview: "desc 1", posterPath: "/img1"),
    Movie(id: 2, title: "test movie", overview: "desc 1", posterPath: "/img2"),
    Movie(id: 3, title: "test movie", overview: "desc 1", posterPath: "/img3"),
    Movie(id: 4, title: "test movie", overview: "desc 1", posterPath: "/img4"),
  ];
  test("should get trending movies from the repository", ()async{
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async =>tMoviesList);
    // fact
    final result=await usecase();
  //   assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}