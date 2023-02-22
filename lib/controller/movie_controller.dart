import 'package:app_treinow_movies/models/movies.dart';
import 'package:app_treinow_movies/repositories/movies_repo.dart';
import 'package:flutter/foundation.dart';

class MovieController {
  final MoviesRepository? _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies.value = await _moviesRepository?.getMovies();
  }
}
