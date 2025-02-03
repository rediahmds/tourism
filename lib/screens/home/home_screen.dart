import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/data/api/api_services.dart';
import 'package:tourism/data/models/tourism_list_response.dart';
import 'package:tourism/provider/home/tourism_list_provider.dart';
import 'package:tourism/static/tourism_list_result_state.dart';
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
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TourismListProvider>().fetchTourismList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      // body: FutureBuilder(
      //   future: _futureTourismReponse,
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return const Center(child: CircularProgressIndicator());
      //
      //       case ConnectionState.done:
      //         if (snapshot.hasError) {
      //           final errorMessage = snapshot.error.toString();
      //           return Center(
      //             child: Text(errorMessage),
      //           );
      //         }
      //
      //         final tourismList = snapshot.data!.places;
      //         return ListView.builder(
      //           itemCount: tourismList.length,
      //           itemBuilder: (context, index) {
      //             final tourism = tourismList[index];
      //
      //             return TourismCard(
      //                 tourism: tourism,
      //                 onTap: () {
      //                   Navigator.pushNamed(
      //                       context, NavigationRoute.detailRoute.name,
      //                       arguments: tourism.id);
      //                 });
      //           },
      //         );
      //
      //       default:
      //         return const SizedBox();
      //     }
      //   },
      // ),
      body: Consumer<TourismListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            TourismListLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            TourismListLoadedState(data: var tourismList) => ListView.builder(
                itemCount: tourismList.length,
                itemBuilder: (context, index) {
                  final tourism = tourismList[index];

                  return TourismCard(
                    tourism: tourism,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: tourism.id,
                      );
                    },
                  );
                },
              ),
            TourismListErrorState(error: var message) => Center(
                child: Text(message),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
