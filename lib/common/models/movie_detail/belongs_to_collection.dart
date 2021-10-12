
import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection.g.dart';

@JsonSerializable()
class BelongsToCollection {
    String? backdrop_path;
    int id;
    String name;
    String poster_path;

    BelongsToCollection({required this.backdrop_path, required this.id, required this.name, required this.poster_path});

    factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
    Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);

}