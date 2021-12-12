# assessment

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// Steps 
For this Assessment i used Mvvm Pattern with Providers.

I created 3 UI screens

#UI Screens:

HomeScreen() --> This is launching screen where user can select the country, and based on 
                 selected country will show all the leagues.
                 Default value i was setted to 'India' and showing India leagues.

TeamScreen() --> Once User selected the league, will show all the Teams and user can select the team.

TeamDetailScreen() --> In this screen will show Team Badge and Description and will show this screen when user 
                     selected the team from TeamScreen().

#ViewModels:

I created 3 ViewModel classes for 3 UI screens to handle the Business logic.

1. CountryDataViewModel  -- Handling Countries data business logic.
2. LeagueDataViewModel   -- Handling League data business logic.
3. TeamsDataViewModel    -- Handling Team data business logic.

#API Repos:

Created 3 API Repos for handling http requests.
1. CountryDataRepo  -- To fetch country data from network and setting the results.
2. LeagueDataRepo  -- To fetch league  data by country from network and setting the results.
3. TeamDataRepo  -- To fetch team data from network by selected league and setting the results.


#Models:
Created 3 Data Model classes.
1. CountryDataModel  -- This POJO class holding country data.
2. LeagueDataModel  -- This POJO class holding leagues data.
3. TeamDataModel  -- This POJO class holding teams data.

#Utils:

Below are Utils class:
1. APIStatus : To set the API status SUCCESS and FAILURE.
2. AppLoading : To showing the loading progress bar while fetching data from server.
3. Constants : To maintain all the Data Url data.
4. DataConnection: To know the network status.
5. NoData : To show if network results are empty.






