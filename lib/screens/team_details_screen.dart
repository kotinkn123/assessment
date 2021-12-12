import 'package:assessment/viewmodels/teams_data_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({Key? key}) : super(key: key);

  @override
  _TeamDetailScreenState createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TeamsDataViewModel teamsDataViewModel = context.watch<TeamsDataViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(teamsDataViewModel.selectedTeamData.strTeam.toString()),
      ),
      body: Container(
        color: Colors.amber,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      teamsDataViewModel.selectedTeamData.strTeamBadge ?? '',
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator()),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.amber,
                    child: Text(
                      teamsDataViewModel.selectedTeamData.strDescriptionEN ??
                          '',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
