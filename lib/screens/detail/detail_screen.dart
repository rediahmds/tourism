import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/data/api/api_services.dart';
import 'package:tourism/data/models/tourism.dart';
import 'package:tourism/data/models/tourism_detail_response.dart';
import 'package:tourism/provider/detail/bookmark_icon.dart';
import 'package:tourism/screens/detail/image_overview.dart';
import 'package:tourism/screens/detail/location_info.dart';
import 'package:tourism/screens/detail/likes.dart';
import 'package:tourism/screens/detail/description.dart';
import 'package:tourism/screens/detail/button_bookmark.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.tourismId});

  final int tourismId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // use two different vars
  // one, to store response from api
  late Future<TourismDetailResponse> _futureTourismDetailResponse; // api req
  // two, store tourism data only when the req have success response
  final Completer<Tourism> _completerTourismDetail =
      Completer<Tourism>(); // wait for api response above

  @override
  void initState() {
    super.initState();

    _futureTourismDetailResponse =
        APIServices().getTourismDetail(widget.tourismId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: const Text("Tourism Detail"),
          centerTitle: true,
          actions: [
            ChangeNotifierProvider(
                create: (context) => BookmarkIconProvider(),
                child: FutureBuilder(
                    future: _completerTourismDetail.future,
                    // receive tourism when got success response
                    builder: (context, snapshot) {
                      return switch (snapshot.connectionState) {
                        ConnectionState.done => ButtonBookmark(
                            // cannot use the response from api yet
                            // cuz it handled in different way.
                            tourism: snapshot
                                .data!, // tourism data only available when got success response
                            // well it can actually use the response object. just change the future task
                            // and it will do the job. but, is it efficient? NO.
                            // cuz you have to do the req here and for the body.
                            // In that case, we'll be working on the same process twice? WHY? DOUCHEBAG
                            // SUMMARY: Use two different object
                            // one, to do the req
                            // two, receive the data when got success response
                          ),
                        _ => const SizedBox(),
                      };
                    }))
          ],
        ),
        body: FutureBuilder(
            future: _futureTourismDetailResponse,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    final errorMessage = snapshot.error.toString();
                    return Center(child: Text(errorMessage));
                  }

                  // got success response from api
                  final tourism = snapshot.data!.place;

                  // receive the response and use it in bookmark logic
                  _completerTourismDetail.complete(tourism);

                  return bodyOfTourismDetail(tourism);
                default:
                  return const SizedBox();
              }
              ;
            }));
  }

  Widget bodyOfTourismDetail(Tourism tourism) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Column(
        children: [
          ImageOverview(url: tourism.image),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationInfo(name: tourism.name, address: tourism.address),
                Likes(likes: tourism.like)
              ],
            ),
          ),
          Description(descriptionText: tourism.description)
        ],
      ),
    ));
  }
}
