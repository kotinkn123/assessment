import 'dart:convert';

class TeamsDataModel {
  TeamsDataModel({
    this.idTeam,
    this.strTeam,
    this.strSport,
    this.strLeague,
    this.strDescriptionEN,
    this.strCountry,
    this.strTeamBadge,
  });

  late final String? idTeam;
  late final String? strTeam;
  late final String? strSport;
  late final String? strLeague;
  late final String? strDescriptionEN;
  late final String? strCountry;
  late final String? strTeamBadge;

  TeamsDataModel.fromJson(Map<String, dynamic> json) {
    idTeam = json['idTeam'];
    strTeam = json['strTeam'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];
    strDescriptionEN = json['strDescriptionEN'];
    strCountry = json['strCountry'];
    strTeamBadge = json['strTeamBadge'];
  }
}

List<TeamsDataModel> teamsDataFromJson(String str) {
  return List<TeamsDataModel>.from(
      (json.decode(str))['teams'].map((x) => TeamsDataModel.fromJson(x)));
}
