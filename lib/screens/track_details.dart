import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../connections/connect.dart';
import '../controllers/track_controller.dart';

class TrackDetails extends StatelessWidget {
  const TrackDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Details"),
      ),
      body: TrackBody(),
    );
  }
}

class TrackBody extends StatelessWidget {
  TrackBody({Key? key}) : super(key: key);
  final argumentData=Get.arguments;
  final TrackController trackController=Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLyrics(argumentData['track_id']),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Obx(()=>Container(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Title"),
                    body(trackController.track.value.track_name.toString()),
                    header("Track Rating"),
                    body(trackController.track.value.track_rating.toString()),
                    header("Album Name"),
                    body(trackController.track.value.album_name.toString()),
                    header("Updated Time"),
                    body(trackController.track.value.updated_time.toString()),
                    header("Lyrics"),
                    body(trackController.lyrics.value.toString())
                  ],
                ),
              ),
            ));
          }
          return const Center(child: CircularProgressIndicator(),);
        }
    );
  }

  Widget header(String title) {
    return Text(title, style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),);
  }

  Widget body(String body) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(body, style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20.0
      ),),
    );
  }
}

