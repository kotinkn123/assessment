import 'package:assessment/api_repo/league_data_repo.dart';
import 'package:assessment/models/league_data_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:assessment/utils/data_connection.dart';
import 'package:flutter/cupertino.dart';

class LeagueDataViewModel extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  String _selectedCountry = "";

  String _selectedLeague = "";

  String _errorMessage = "";

  bool _isOnline = false;

  static List<LeagueDataModel> _leagueDataList = [];

  final LeagueDataRepo _leagueDataRepo = LeagueDataRepo();

  LeagueDataViewModel() {
    setCountry("India");
  }

  setCountry(String selectedCountry) {
    setLoading(true);
    setErrorMessage("");
    _selectedCountry = selectedCountry;
    getLeagueDataByCountry(_selectedCountry);
  }

  setSelectedLeague(String selectedLeague) {
    _selectedLeague = selectedLeague;
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
  }

  setOnline(bool isOnline) {
    _isOnline = isOnline;
  }

  String get errorMessage => _errorMessage;

  List<LeagueDataModel> get leagueDataList => _leagueDataList;

  String get selectedCountry => _selectedCountry;

  String get selectedLeague => _selectedLeague;

  bool get isOnline => _isOnline;

  setLeagueData(List<LeagueDataModel> leagueDataList) {
    _leagueDataList = leagueDataList;
    print("league list:${_leagueDataList.length}");
  }

  clearLeagueData() {
    _leagueDataList.clear();
    setLoading(true);
  }

  getLeagueDataByCountry(String country) async {
    var response = await _leagueDataRepo.getLeagueData(country);
    if (response is Success) {
      setLeagueData(response.response as List<LeagueDataModel>);
    }
    if (response is Failure) {
      setErrorMessage(response.errorResponse.toString());
    }
    setLoading(false);
  }

  checkDataConnection() async {
    bool result = await DataConnection.isOnline();
    setOnline(result);
  }
}
