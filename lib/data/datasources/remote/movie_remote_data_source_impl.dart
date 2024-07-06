import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_movie_app/data/datasources/movie_remote_data_source.dart';

import '../../../core.errors/server_exception.dart';
import '../../models/movie_model.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  late http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL="https://api.themoviedb.org/3";
  static const API_KEY="8f2aabc9f35d2ab2a73c88e6a502a5c1";
  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response=await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY")
    );
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final List<MovieModel> movies=(responseBody("results") as List<MovieModel>)
      .map((movie)=>MovieModel.fromJson(movie as Map<String, dynamic>)).toList();
      return movies;

    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async{
    final response=await client.get(Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY")
    );
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final List<MovieModel> movies=(responseBody("results") as List<MovieModel>)
          .map((movie)=>MovieModel.fromJson(movie as Map<String, dynamic>)).toList();
      return movies;

    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async{
    final response=await client.get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY")
    );
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final List<MovieModel> movies=(responseBody("results") as List<MovieModel>)
          .map((movie)=>MovieModel.fromJson(movie as Map<String, dynamic>)).toList();
      return movies;

    }else{
      throw ServerException();
    }
  }

}