import 'dart:convert';

class LeagueDataModel {
  String idLeague;
  String strSport;
  String strCountry;
  String strLeague;
  late String? strBadge;

  LeagueDataModel({
    required this.idLeague,
    required this.strSport,
    required this.strCountry,
    required this.strLeague,
    this.strBadge,
  });

  factory LeagueDataModel.fromJson(Map<String, dynamic> json) =>
      LeagueDataModel(
        idLeague: json["idLeague"],
        strSport: json["strSport"],
        strCountry: json["strCountry"],
        strLeague: json["strLeague"],
        strBadge: json['strBadge'],
      );
}

List<LeagueDataModel> leagueDataFromJson(String str) {
  return List<LeagueDataModel>.from(
      (json.decode(str))['countrys'].map((x) => LeagueDataModel.fromJson(x)));
}
