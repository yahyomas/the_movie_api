class ActorFilms {
  ActorFilms({
    required this.cast,
    required this.crew,
    required this.id,
  });

  late final List<Cast> cast;
  late final List<Crew> crew;
  late final int id;

  ActorFilms.fromJson(Map<String, dynamic> json) {
    cast = List.from(json['cast']).map((e) => Cast.fromJson(e)).toList();
    crew = List.from(json['crew']).map((e) => Crew.fromJson(e)).toList();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cast'] = cast.map((e) => e.toJson()).toList();
    _data['crew'] = crew.map((e) => e.toJson()).toList();
    _data['id'] = id;
    return _data;
  }
}

class Cast {
  Cast({
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    this.title,
    required this.popularity,
    required this.character,
    required this.creditId,
    required this.order,
  });

  late final int id;
  late final String backdropPath;
  late final List<dynamic> genreIds;
  late final String originalLanguage;
  late final String? originalTitle;
  late final String posterPath;
  late final double voteAverage;
  late final String? overview;
  late final String releaseDate;
  late final String? title;
  late final double popularity;
  late final String character;
  late final String creditId;
  late final int order;

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    backdropPath = json['backdrop_path'] ?? '';
    genreIds = json['genre_ids'];
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'];
    posterPath = json['poster_path'] ?? '';
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'] ?? '';
    title = json['title'];
    popularity = json['popularity'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['poster_path'] = posterPath;
    _data['vote_average'] = voteAverage;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['popularity'] = popularity;
    _data['character'] = character;
    _data['credit_id'] = creditId;
    _data['order'] = order;
    return _data;
  }
}

class Crew {
  Crew({
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
    required this.adult,
    required this.backdropPath,
    required this.title,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.creditId,
    required this.department,
    required this.job,
  });

  late final String? posterPath;
  late final bool? video;
  late final double voteAverage;
  late final String? overview;
  late final String releaseDate;
  late final int? voteCount;
  late final bool? adult;
  late final String backdropPath;
  late final String title;
  late final int? id;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final double popularity;
  late final String creditId;
  late final String department;
  late final String job;

  Crew.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'] ?? '';
    voteCount = json['vote_count'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'] ?? '';
    title = json['title'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    popularity = json['popularity'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['vote_count'] = voteCount;
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['title'] = title;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['popularity'] = popularity;
    _data['credit_id'] = creditId;
    _data['department'] = department;
    _data['job'] = job;
    return _data;
  }
}
