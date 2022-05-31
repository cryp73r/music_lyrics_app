import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../notifier/connectivity_change_notifier.dart';
import './track_details.dart';
import '../connections/connect.dart';
import '../controllers/track_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music App"),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  final TrackController trackController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ConnectivityChangeNotifier>(builder: (BuildContext context,
          ConnectivityChangeNotifier connectivityChangeNotifier,
          Widget? child) {
        if (connectivityChangeNotifier.connectivity!=ConnectivityResult.none) {
          return FutureBuilder(
            future: getTracks(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Obx(() => ListView.builder(
                  itemCount: trackController.trackList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.library_music_outlined),
                        title: Text(trackController.trackList[index].track_name.toString()),
                        subtitle: Text(trackController.trackList[index].album_name.toString()),
                        trailing: Text(trackController.trackList[index].artist_name.toString()),
                        onTap: ()=>Get.to(()=>const TrackDetails(), arguments: {"track_id": trackController.trackList[index].track_id}),
                      ),
                    );
                  },
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        } else {
          return const Center(child: Text("No Internet Connection"),);
        }
      },)
    );
  }
}
