import 'package:assessment/models/country_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:assessment/utils/constants.dart';
import 'package:http/http.dart' as http;

class CountryDataRepo {
  Future<Object> getCountriesData() async {
    try {
      var response = await http.get(Uri.parse(Constants.COUNTRY_DATA_URL));
      if (response.statusCode == 200) {
        return Success(code: 200, response: countryDataFromJson(response.body));
      } else {
        return Failure(errorResponse: "Http Exception");
      }
    } catch (e) {
      return Failure(errorResponse: "No Data Found");
    }
  }
}
