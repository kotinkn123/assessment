import 'package:assessment/api_repo/teams_data_repo.dart';
import 'package:assessment/models/teams_data_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:flutter/cupertino.dart';

class TeamsDataViewModel extends ChangeNotifier {
  static List<TeamsDataModel> _teamsDataList = [];
  List<TeamsDataModel> _originalTeamDataList = [];
  final TeamsDataRepo _teamDataRepo = TeamsDataRepo();
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  String _queryString = "";

  String _selectedLeague = "";

  late TeamsDataModel _SelectedTeamDataModel;

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setTeamsDataList(List<TeamsDataModel> teamDataList) {
    _teamsDataList = teamDataList;
  }

  setLeagueData(String selectedLeague) {
    _selectedLeague = selectedLeague;
    if (_queryString.isEmpty) {
      getTeamsDataByLeague(_selectedLeague);
    }
  }

  List<TeamsDataModel> get teamsDataList => _teamsDataList;

  getTeamsDataByLeague(String league) async {
    print("getTeamsDataByLeague called");
    var response = await _teamDataRepo.getTeamsData(league);
    if (response is Success) {
      _originalTeamDataList = response.response as List<TeamsDataModel>;
      setTeamsDataList(response.response as List<TeamsDataModel>);
    }
    if (response is Failure) {
      //setErrorMessage(response.errorResponse.toString());
    }
    setLoading(false);
  }

  setSelectedTeam(TeamsDataModel selectedTeamData) {
    _SelectedTeamDataModel = selectedTeamData;
  }

  TeamsDataModel get selectedTeamData => _SelectedTeamDataModel;

  //search results
  searchResults(String queryString) {
    _queryString = queryString;
    setLoading(true);
    List<TeamsDataModel> searchlist = [];
    for (int i = 0; i < _originalTeamDataList.length; i++) {
      String str = _originalTeamDataList[i].strTeam!.toLowerCase();
      if (str.contains(queryString)) {
        searchlist.add(_originalTeamDataList[i]);
      }
    }
    setTeamsDataList(searchlist);
    setLoading(false);
  }
}
