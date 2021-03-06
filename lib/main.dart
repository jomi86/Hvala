// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:Hvala/screens/HListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/screen_routes.dart';
import 'screens/page_donate.dart';
import 'screens/page_favorites.dart';
import 'screens/screen_app.dart';
import 'theme/HTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: HTheme.getDefaultTheme(context),
        darkTheme: HTheme.getDefaultTheme(context),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: SCREEN_APP,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case SCREEN_APP:
              return MaterialPageRoute(
                builder: (context) => ScreenApp(),
                fullscreenDialog: false,
                settings: settings,
              );
            case SCREEN_DONATE:
              return MaterialPageRoute(
                builder: (context) => PageDonate(),
                fullscreenDialog: false,
                settings: settings,
              );
            case SCREEN_GENERIC_LIST:
              return CupertinoPageRoute(
                builder: (context) => HListPage(),
                fullscreenDialog: false,
                settings: settings,
              );
            case SCREEN_FAVORITES:
              return CupertinoPageRoute(
                builder: (context) => FavoritesPage(),
                fullscreenDialog: false,
                settings: settings,
              );
          }
          return null;
        });
  }
}
