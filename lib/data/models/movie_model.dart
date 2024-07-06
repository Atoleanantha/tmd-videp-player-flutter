class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  MovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  //convert json into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['posterPath']);
  }
  //convert MovieModel into json
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'posterPath':posterPath,
      'overview':overview

    };
  }
}
