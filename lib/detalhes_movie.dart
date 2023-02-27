import 'package:app_treinow_movies/models/movies.dart';
import 'package:app_treinow_movies/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetalhesMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Results data = Get.arguments;
    String image = "https://image.tmdb.org/t/p/original/";
    Api api = Api();

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 200,
                width: Get.width,
                color: Theme.of(context).primaryColor,
                child: Image.network(
                  image + "${data.posterPath}",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                  top: 5,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 5,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  bottom: 10,
                  child: Text(
                    "${data.title}",
                    style: TextStyle(fontSize: 22),
                  )),
            ]),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        '${data.title} ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        api.formatData(data.releaseDate.toString()),
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                      minRating: 1,
                      initialRating: double.parse("${data.voteAverage}"),
                      itemSize: 15,
                      tapOnlyMode: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemPadding: EdgeInsets.symmetric(horizontal: 5),
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.black26,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Sinopse",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${data.overview}",
                            maxLines: 14,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
