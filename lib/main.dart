import 'package:assessment/screens/home_screen.dart';
import 'package:assessment/viewmodels/country_data_viewmodel.dart';
import 'package:assessment/viewmodels/league_data_viewmodel.dart';
import 'package:assessment/viewmodels/teams_data_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CountryDataViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => LeagueDataViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => TeamsDataViewModel(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}
