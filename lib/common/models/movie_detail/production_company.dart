
import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable()
class ProductionCompany {
    int id;
    String? logo_path;
    String name;
    String origin_country;

    ProductionCompany({required this.id, this.logo_path, required this.name, required this.origin_country});

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
    Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);

}