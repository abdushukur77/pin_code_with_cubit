
import 'continent_model.dart';

class CountryModel {
  CountryModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji
  });
  String code;
  String name;
  String phone;
  ContinentModel continent;
  String capital;
  String currency;
  String emoji;

  factory CountryModel.fromJson(Map<String,dynamic> json){
    return CountryModel(
        code: json['code'] as String? ?? "",
        name: json['name'] as String? ?? "" ,
        phone: json['phone'] as String? ?? "" ,
        continent:ContinentModel.fromJson(json['continent']),
        capital:json['capital'] as String? ?? "" ,
        currency: json['currency'] as String? ?? "" ,
        emoji: json['emoji'] as String? ?? "");
  }
}
