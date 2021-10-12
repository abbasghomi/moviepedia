
import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable()
class SpokenLanguage {
    String english_name;
    String iso_639_1;
    String name;

    SpokenLanguage({required this.english_name, required this.iso_639_1, required this.name});

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
    Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);

}