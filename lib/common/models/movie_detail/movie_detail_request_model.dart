import 'package:json_annotation/json_annotation.dart';
import 'package:moviepedia/common/models/movie_detail/belongs_to_collection.dart';
import 'package:moviepedia/common/models/movie_detail/genre.dart';
import 'package:moviepedia/common/models/movie_detail/production_company.dart';
import 'package:moviepedia/common/models/movie_detail/production_country.dart';
import 'package:moviepedia/common/models/movie_detail/spoken_language.dart';

part 'movie_detail_request_model.g.dart';

@JsonSerializable()
class MovieDetailRequestModel {
    bool adult;
    String backdrop_path;
    BelongsToCollection belongs_to_collection;
    int budget;
    List<Genre>? genres;
    String homepage;
    int id;
    String imdb_id;
    String original_language;
    String original_title;
    String overview;
    double popularity;
    String poster_path;
    List<ProductionCompany>? production_companies;
    List<ProductionCountry>? production_countries;
    String release_date;
    int revenue;
    int runtime;
    List<SpokenLanguage>? spoken_languages;
    String status;
    String tagline;
    String title;
    bool video;
    double vote_average;
    int vote_count;

    MovieDetailRequestModel({required this.adult, required this.backdrop_path, required this.belongs_to_collection, required this.budget, required this.genres, required this.homepage, required this.id, required this.imdb_id, required this.original_language, required this.original_title, required this.overview, required this.popularity, required this.poster_path, required this.production_companies, required this.production_countries, required this.release_date, required this.revenue, required this.runtime, required this.spoken_languages, required this.status, required this.tagline, required this.title, required this.video, required this.vote_average, required this.vote_count});

    factory MovieDetailRequestModel.fromJson(Map<String, dynamic> json) => _$MovieDetailRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$MovieDetailRequestModelToJson(this);

}