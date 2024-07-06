import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/data/datasources/movie_remote_data_source.dart';
@GenerateMocks([http.Client])

void main(){
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(()=>{mockHttpClient=MockClient();
    dataSource =MovieRemoteDataSourceImpl(client:mockHttpClient);

  });

  test("should perform a GET request on url to get trending movies",
   () async =>{
    when(mockHttpClient.get(any)).
  thenAnswer(
  (_) async => http.Response("Dur api response",200)
  );
    await dataSource.getTrendingMovies();

     verify(mockHttpClient.get(Uri.parse("our api")));
  });
}