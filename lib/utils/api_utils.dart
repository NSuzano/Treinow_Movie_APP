import 'dart:convert';

import 'package:app_treinow_movies/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Api {
  Future<Movies> getMoviesList() async {
    Movies _movies = Movies();

    final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/4/list/1?page=1&api_key=4286b2981bf3d3006956d368ff07a8cc&language=pt-BR"),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Mjg2YjI5ODFiZjNkMzAwNjk1NmQzNjhmZjA3YThjYyIsInN1YiI6IjYzZjYxZTYzOTkyZmU2MDBiYzNkMTc5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6HVSXwNb0nuEXG1aDcEoNAacY-eJ4EpgeruxH2kHYbU',
        });
    var data = jsonDecode(response.body);

    _movies = Movies.fromJson(data);

    List<Results>? results = _movies.results;

    debugPrint("DATA: ${results?[0].title}");

    return _movies;
  }

  Future<SearchMovie> getMovieSearch({String? movie}) async {
    print("Search Api");
    SearchMovie _movies = SearchMovie();
    List<Results>? _result = [];

    Map<String, dynamic> mapaResult = {};

    final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/search/movie?api_key=4286b2981bf3d3006956d368ff07a8cc&language=pt-BR&query=$movie&page=1&include_adult=false"),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Mjg2YjI5ODFiZjNkMzAwNjk1NmQzNjhmZjA3YThjYyIsInN1YiI6IjYzZjYxZTYzOTkyZmU2MDBiYzNkMTc5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6HVSXwNb0nuEXG1aDcEoNAacY-eJ4EpgeruxH2kHYbU',
        });

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        _movies = SearchMovie.fromJson(data);

        _result = _movies.results;

        if (movie != null) {
          _result = _result
              ?.where((element) =>
                  element.title!.toLowerCase().contains(movie.toLowerCase()))
              .toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('Error: $e');
    }

    print(_result);

    return _movies;
  }

  formatData(String? data) {
    DateTime year = DateTime.parse(data.toString());
    DateFormat dateFormat = DateFormat('y');

    String date = dateFormat.format(year);

    return date;
  }
}
