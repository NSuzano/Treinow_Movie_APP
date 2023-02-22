import 'package:app_treinow_movies/repositories/movies_repo.dart';
import 'package:app_treinow_movies/service/dio_service.dart';
import 'package:app_treinow_movies/utils/api_utils.dart';
import 'package:http/http.dart';

import '../models/movies.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService? _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService!.getDio().get(Api.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
