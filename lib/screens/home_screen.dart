import 'dart:io';

import 'package:assessment/models/league_data_model.dart';
import 'package:assessment/screens/teams_screen.dart';
import 'package:assessment/utils/app_loading.dart';
import 'package:assessment/utils/no_data.dart';
import 'package:assessment/utils/no_data_connection.dart';
import 'package:assessment/viewmodels/country_data_viewmodel.dart';
import 'package:assessment/viewmodels/league_data_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isConnected = true;
  List countryDataList = [];
  String _selectedCountry = "India";
  late LeagueDataViewModel leagueDataViewModel;
  late CountryDataViewModel countryDataViewModel;

  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    countryDataViewModel = context.watch<CountryDataViewModel>();
    leagueDataViewModel = context.watch<LeagueDataViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                color: Colors.lime,
                width: double.infinity,
                alignment: Alignment.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _selectedCountry,
                    hint: const Text("Select Country"),
                    onChanged: (newValue) {
                      setState(() {
                        if (_selectedCountry != newValue.toString()) {
                          leagueDataViewModel.clearLeagueData();
                          _selectedCountry = newValue.toString();
                          leagueDataViewModel.setCountry(_selectedCountry);
                        }
                      });
                    },
                    items: CountryDataViewModel.countryDataList.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.nameEn),
                        value: item.nameEn,
                      );
                    }).toList(),
                  ),
                )),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              child: _uiUpdate(),
            ),
            flex: 8,
          )
        ],
      ),
    );
  }

  _uiUpdate() {
    if (!_isConnected) {
      return const NoInternetConnection();
    } else if (leagueDataViewModel.isLoading) {
      return const AppLoading();
    } else if (leagueDataViewModel.errorMessage.isNotEmpty) {
      return const NoDataFound();
    } else {
      return ListView.builder(
          itemCount: leagueDataViewModel.leagueDataList.length,
          itemBuilder: (context, int index) {
            LeagueDataModel leagueDataModel =
                leagueDataViewModel.leagueDataList[index];
            return Card(
              margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: ListTile(
                contentPadding: const EdgeInsets.all(4),
                tileColor: Colors.white,
                title: Text(leagueDataModel.strLeague),
                trailing: const Icon(Icons.arrow_forward),
                leading: CachedNetworkImage(
                  imageUrl: leagueDataModel.strBadge ?? '',
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  leagueDataViewModel
                      .setSelectedLeague(leagueDataModel.strLeague);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TeamScreen(league: leagueDataModel.strLeague)));
                },
              ),
            );
          });
    }
  }

  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
    }
  }
}
