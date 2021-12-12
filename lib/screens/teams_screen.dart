import 'package:assessment/models/teams_data_model.dart';
import 'package:assessment/screens/team_details_screen.dart';
import 'package:assessment/utils/app_loading.dart';
import 'package:assessment/viewmodels/teams_data_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TeamScreen extends StatefulWidget {
  final String league;
  const TeamScreen({Key? key, required this.league}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  late TeamsDataViewModel teamsDataViewModel;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    teamsDataViewModel = context.watch<TeamsDataViewModel>();
    teamsDataViewModel.setLeagueData(widget.league);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.league),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  color: Colors.lime,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: TextFormField(
                    controller: _textEditingController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    onChanged: (queryString) {
                      teamsDataViewModel
                          .searchResults(queryString.toLowerCase());
                    },
                    decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black12),
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  )),
              flex: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                child: _teamsUiUpdate(),
              ),
              flex: 8,
            )
          ],
        ));
  }

  _teamsUiUpdate() {
    print("isloading: ${teamsDataViewModel.isLoading}");
    if (teamsDataViewModel.isLoading) {
      return const AppLoading();
    } else {
      return ListView.builder(
          itemCount: teamsDataViewModel.teamsDataList.length,
          itemBuilder: (context, int index) {
            TeamsDataModel teamsDataModel =
                teamsDataViewModel.teamsDataList[index];
            return Card(
              margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: ListTile(
                contentPadding: const EdgeInsets.all(4),
                tileColor: Colors.white,
                title: Text(teamsDataModel.strTeam ?? ''),
                trailing: const Icon(Icons.arrow_forward),
                leading: CachedNetworkImage(
                  imageUrl: teamsDataModel.strTeamBadge ?? '',
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  teamsDataViewModel.setSelectedTeam(teamsDataModel);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeamDetailScreen()));
                },
              ),
            );
          });
    }
  }
}
