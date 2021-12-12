import 'dart:convert';

class CountryDataModel {
  late final String nameEn;

  CountryDataModel({
    required this.nameEn,
  });

  CountryDataModel.fromJson(Map json) {
    nameEn = json['name_en'];
  }
}

List<CountryDataModel> countryDataFromJson(String str) {
  return List<CountryDataModel>.from(
      (json.decode(str))['countries'].map((x) => CountryDataModel.fromJson(x)));
}
