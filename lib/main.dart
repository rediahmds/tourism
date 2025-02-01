import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/data/models/tourism.dart';
import 'package:tourism/provider/detail/bookmark_list.dart';
import 'package:tourism/provider/main/index_bottom_nav.dart';
import './screens/detail/detail_screen.dart';
import 'package:tourism/static/navigation_route.dart';
import 'styles/themes/tourism_theme.dart';
import 'screens/main/main_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => IndexBottomNavProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => BookmarkListProvider(),
      )
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
            tourismId: ModalRoute.of(context)?.settings.arguments as int),
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
