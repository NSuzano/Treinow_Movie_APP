import 'package:flutter/cupertino.dart';

class Movies {
  String? posterPath;
  int? id;
  String? backdropPath;
  int? totalResults;
  bool? public;
  int? revenue;
  int? page;
  List<Results>? results;
  ObjectIds? objectIds;
  String? iso6391;
  int? totalPages;
  String? description;
  CreatedBy? createdBy;
  String? iso31661;
  double? averageRating;
  int? runtime;
  String? name;
  Comments? comments;

  Movies(
      {this.posterPath,
      this.id,
      this.backdropPath,
      this.totalResults,
      this.public,
      this.revenue,
      this.page,
      this.results,
      this.objectIds,
      this.iso6391,
      this.totalPages,
      this.description,
      this.createdBy,
      this.iso31661,
      this.averageRating,
      this.runtime,
      this.name,
      this.comments});

  Movies.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    backdropPath = json['backdrop_path'];
    totalResults = json['total_results'];
    public = json['public'];
    revenue = json['revenue'];
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    objectIds = json['object_ids'] != null
        ? new ObjectIds.fromJson(json['object_ids'])
        : null;
    iso6391 = json['iso_639_1'];
    totalPages = json['total_pages'];
    description = json['description'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    iso31661 = json['iso_3166_1'];
    averageRating = json['average_rating'];
    runtime = json['runtime'];
    name = json['name'];
    comments = json['comments'] != null
        ? new Comments.fromJson(json['comments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['backdrop_path'] = this.backdropPath;
    data['total_results'] = this.totalResults;
    data['public'] = this.public;
    data['revenue'] = this.revenue;
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    if (this.objectIds != null) {
      data['object_ids'] = this.objectIds!.toJson();
    }
    data['iso_639_1'] = this.iso6391;
    data['total_pages'] = this.totalPages;
    data['description'] = this.description;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['iso_3166_1'] = this.iso31661;
    data['average_rating'] = this.averageRating;
    data['runtime'] = this.runtime;
    data['name'] = this.name;
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    return data;
  }
}

class Results {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  String? originalTitle;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;

  Results(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.originalTitle,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['original_language'] = this.originalLanguage;
    data['title'] = this.title;
    data['backdrop_path'] = this.backdropPath;
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    return data;
  }
}

class ObjectIds {
  String? movie100402;
  String? movie2080;
  String? movie76170;
  String? movie71676;
  String? movie1724;
  String? movie68721;
  String? movie49538;
  String? movie1930;
  String? movie10138;
  String? movie99861;
  String? movie1979;
  String? movie1726;
  String? movie118340;
  String? movie13056;
  String? movie76338;
  String? movie127585;
  String? movie102382;
  String? movie1771;
  String? movie10195;
  String? movie24428;

  ObjectIds(
      {this.movie100402,
      this.movie2080,
      this.movie76170,
      this.movie71676,
      this.movie1724,
      this.movie68721,
      this.movie49538,
      this.movie1930,
      this.movie10138,
      this.movie99861,
      this.movie1979,
      this.movie1726,
      this.movie118340,
      this.movie13056,
      this.movie76338,
      this.movie127585,
      this.movie102382,
      this.movie1771,
      this.movie10195,
      this.movie24428});

  ObjectIds.fromJson(Map<String, dynamic> json) {
    movie100402 = json['movie:100402'];
    movie2080 = json['movie:2080'];
    movie76170 = json['movie:76170'];
    movie71676 = json['movie:71676'];
    movie1724 = json['movie:1724'];
    movie68721 = json['movie:68721'];
    movie49538 = json['movie:49538'];
    movie1930 = json['movie:1930'];
    movie10138 = json['movie:10138'];
    movie99861 = json['movie:99861'];
    movie1979 = json['movie:1979'];
    movie1726 = json['movie:1726'];
    movie118340 = json['movie:118340'];
    movie13056 = json['movie:13056'];
    movie76338 = json['movie:76338'];
    movie127585 = json['movie:127585'];
    movie102382 = json['movie:102382'];
    movie1771 = json['movie:1771'];
    movie10195 = json['movie:10195'];
    movie24428 = json['movie:24428'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie:100402'] = this.movie100402;
    data['movie:2080'] = this.movie2080;
    data['movie:76170'] = this.movie76170;
    data['movie:71676'] = this.movie71676;
    data['movie:1724'] = this.movie1724;
    data['movie:68721'] = this.movie68721;
    data['movie:49538'] = this.movie49538;
    data['movie:1930'] = this.movie1930;
    data['movie:10138'] = this.movie10138;
    data['movie:99861'] = this.movie99861;
    data['movie:1979'] = this.movie1979;
    data['movie:1726'] = this.movie1726;
    data['movie:118340'] = this.movie118340;
    data['movie:13056'] = this.movie13056;
    data['movie:76338'] = this.movie76338;
    data['movie:127585'] = this.movie127585;
    data['movie:102382'] = this.movie102382;
    data['movie:1771'] = this.movie1771;
    data['movie:10195'] = this.movie10195;
    data['movie:24428'] = this.movie24428;
    return data;
  }
}

class CreatedBy {
  String? gravatarHash;
  String? name;
  String? username;

  CreatedBy({this.gravatarHash, this.name, this.username});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json['gravatar_hash'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gravatar_hash'] = this.gravatarHash;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}

class Comments {
  Null? movie100402;
  Null? movie2080;
  Null? movie76170;
  Null? movie71676;
  Null? movie1724;
  Null? movie68721;
  Null? movie49538;
  Null? movie1930;
  Null? movie10138;
  String? movie99861;
  Null? movie1979;
  Null? movie1726;
  String? movie118340;
  Null? movie13056;
  Null? movie76338;
  Null? movie127585;
  Null? movie102382;
  Null? movie1771;
  Null? movie10195;
  Null? movie24428;

  Comments(
      {this.movie100402,
      this.movie2080,
      this.movie76170,
      this.movie71676,
      this.movie1724,
      this.movie68721,
      this.movie49538,
      this.movie1930,
      this.movie10138,
      this.movie99861,
      this.movie1979,
      this.movie1726,
      this.movie118340,
      this.movie13056,
      this.movie76338,
      this.movie127585,
      this.movie102382,
      this.movie1771,
      this.movie10195,
      this.movie24428});

  Comments.fromJson(Map<String, dynamic> json) {
    movie100402 = json['movie:100402'];
    movie2080 = json['movie:2080'];
    movie76170 = json['movie:76170'];
    movie71676 = json['movie:71676'];
    movie1724 = json['movie:1724'];
    movie68721 = json['movie:68721'];
    movie49538 = json['movie:49538'];
    movie1930 = json['movie:1930'];
    movie10138 = json['movie:10138'];
    movie99861 = json['movie:99861'];
    movie1979 = json['movie:1979'];
    movie1726 = json['movie:1726'];
    movie118340 = json['movie:118340'];
    movie13056 = json['movie:13056'];
    movie76338 = json['movie:76338'];
    movie127585 = json['movie:127585'];
    movie102382 = json['movie:102382'];
    movie1771 = json['movie:1771'];
    movie10195 = json['movie:10195'];
    movie24428 = json['movie:24428'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie:100402'] = this.movie100402;
    data['movie:2080'] = this.movie2080;
    data['movie:76170'] = this.movie76170;
    data['movie:71676'] = this.movie71676;
    data['movie:1724'] = this.movie1724;
    data['movie:68721'] = this.movie68721;
    data['movie:49538'] = this.movie49538;
    data['movie:1930'] = this.movie1930;
    data['movie:10138'] = this.movie10138;
    data['movie:99861'] = this.movie99861;
    data['movie:1979'] = this.movie1979;
    data['movie:1726'] = this.movie1726;
    data['movie:118340'] = this.movie118340;
    data['movie:13056'] = this.movie13056;
    data['movie:76338'] = this.movie76338;
    data['movie:127585'] = this.movie127585;
    data['movie:102382'] = this.movie102382;
    data['movie:1771'] = this.movie1771;
    data['movie:10195'] = this.movie10195;
    data['movie:24428'] = this.movie24428;
    return data;
  }
}

class SearchMovie {
  int? page;
  List<Results>? results;
  int? totalResults;
  int? totalPages;

  SearchMovie({this.page, this.results, this.totalResults, this.totalPages});

  SearchMovie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
