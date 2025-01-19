import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';
import 'package:tourism/screens/home/home_screen.dart';
import './screens/detail/detail_screen.dart';
import 'package:tourism/static/navigation_route.dart';
import 'styles/themes/tourism_theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
            tourism: ModalRoute.of(context)?.settings.arguments as Tourism),
      },
      title: 'Tourism App',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
    );
  }
}
