import 'package:app_treinow_movies/models/movies.dart';
import 'package:app_treinow_movies/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'detalhes_movie.dart';

class PesquisaFilme extends SearchDelegate {
  Api api = Api();
  List<Results>? _result = [];
  String image = "https://image.tmdb.org/t/p/original/";
  SearchMovie search = SearchMovie();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  movieList(String movie) async {
    search = await api.getMovieSearch(movie: movie);

    _result = search.results;

    return _result;
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: movieList(query),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                if (_result!.contains('')) {
                  return Center(
                    child: Text("No Data"),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: .66),
                        itemCount: _result?.length.toInt(),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          String data =
                              api.formatData(_result?[index].releaseDate);
                          return GestureDetector(
                            onTap: (() => Get.to(DetalhesMovie(),
                                arguments: _result?[index])),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                      child: _result?[index].posterPath == null
                                          ? CircularProgressIndicator()
                                          : Image.network(
                                              image +
                                                  "${_result?[index].posterPath}",
                                              fit: BoxFit.fitWidth,
                                              alignment: Alignment.topCenter,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_result?[index].title}",
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        RatingBar.builder(
                                            minRating: 0,
                                            maxRating: 5,
                                            initialRating: double.parse(
                                                "${_result?[index].voteAverage}"),
                                            itemSize: 10,
                                            tapOnlyMode: true,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 10,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1),
                                            itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            }),
                                        SizedBox(height: 2),
                                        Text(
                                          '${_result?[index].overview}',
                                          maxLines: 2,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.70),
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search"),
    );
  }
}
