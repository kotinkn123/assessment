import 'package:assessment/models/league_data_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:assessment/utils/constants.dart';
import 'package:http/http.dart' as http;

class LeagueDataRepo {
  Future<Object> getLeagueData(String country) async {
    Map<String, String> queryParams = {'c': country};
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = Constants.LEAGUES_DATA_URL + queryString;
    try {
      var response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        return Success(code: 200, response: leagueDataFromJson(response.body));
      } else {
        return Failure(errorResponse: "Http Exception");
      }
    } catch (e) {
      return Failure(errorResponse: "No Data Found");
    }
  }
}
