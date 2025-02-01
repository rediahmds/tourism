import 'package:flutter/material.dart';
import 'package:tourism/data/api/api_services.dart';
import 'package:tourism/data/models/tourism_list_response.dart';
import 'tourism_card.dart';
import 'package:tourism/data/models/tourism.dart';
import 'package:tourism/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<TourismListResponse> _futureTourismReponse;

  @override
  void initState() {
    super.initState();

    _futureTourismReponse = APIServices().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      body: FutureBuilder(
        future: _futureTourismReponse,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasError) {
                final errorMessage = snapshot.error.toString();
                return Center(
                  child: Text(errorMessage),
                );
              }

              final tourismList = snapshot.data!.places;
              return ListView.builder(
                itemCount: tourismList.length,
                itemBuilder: (context, index) {
                  final tourism = tourismList[index];

                  return TourismCard(
                      tourism: tourism,
                      onTap: () {
                        Navigator.pushNamed(
                            context, NavigationRoute.detailRoute.name,
                            arguments: tourism.id);
                      });
                },
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
