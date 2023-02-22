import 'package:app_treinow_movies/models/movies.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
