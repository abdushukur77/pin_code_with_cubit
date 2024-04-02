// "code": "AD",
// "name": "Andorra",
// "phone": "376",
// "continent": {
// "code": "EU",
// "name": "Europe"
// },
// "capital": "Andorra la Vella",
// "currency": "EUR",
// "emoji": "🇦🇩"
class ContinentModel{

  String code;
  String name;

  ContinentModel({
    required this.name,
    required this.code
});

  factory ContinentModel.fromJson(Map<String,dynamic> json){

    return ContinentModel(
        name:json['name'] as String? ?? "",
        code: json['code'] as String? ?? "");
  }

}