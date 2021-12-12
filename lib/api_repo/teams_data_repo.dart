import 'package:assessment/models/teams_data_model.dart';
import 'package:assessment/utils/api_status.dart';
import 'package:assessment/utils/constants.dart';
import 'package:http/http.dart' as http;

class TeamsDataRepo {
  Future<Object> getTeamsData(String league) async {
    Map<String, String> queryParams = {'l': league};
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = Constants.TEAMS_DATA_URL + queryString;
    try {
      var response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        return Success(code: 200, response: teamsDataFromJson(response.body));
      } else {
        return Failure(errorResponse: "Http Exception");
      }
    } catch (e) {
      return Failure(errorResponse: "No Data Found");
    }
  }
}
