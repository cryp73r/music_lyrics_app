import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './controllers/track_controller.dart';
import './screens/home.dart';
import './notifier/connectivity_change_notifier.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TrackController trackController=Get.put(TrackController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Music App",
      home: ChangeNotifierProvider(
        create: (context) {
          ConnectivityChangeNotifier changeNotifier=ConnectivityChangeNotifier();
          changeNotifier.initialLoad();
          return changeNotifier;
        },
        builder: (context, child)=>const Home(),
      ),
    );
  }
}
