import 'package:assessment/api_repo/country_data_repo.dart';
import 'package:assessment/models/country_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:flutter/cupertino.dart';

class CountryDataViewModel extends ChangeNotifier {
  static List<CountryDataModel> _countryDataList = [];
  final CountryDataRepo _countryDataRepo = CountryDataRepo();

  CountryDataViewModel() {
    getCountryDataFromProvider();
  }

  static List<CountryDataModel> get countryDataList => _countryDataList;

  setCountryData(List<CountryDataModel> countryDataList) {
    _countryDataList = countryDataList;
  }

  getCountryDataFromProvider() async {
    var response = await _countryDataRepo.getCountriesData();
    if (response is Success) {
      setCountryData(response.response as List<CountryDataModel>);
      notifyListeners();
    }
  }
}
