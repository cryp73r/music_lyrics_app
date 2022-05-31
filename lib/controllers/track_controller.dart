import 'package:get/get.dart';
import '../models/track.dart';

class TrackController extends GetxController {
  Rx<Track> track=Track().obs;
  RxList<Track> trackList=<Track>[].obs;
  RxString lyrics="".obs;
  
  void addTracks(Map<String, dynamic> parsedJson) async {
    List<Track> updatedList=List.generate(parsedJson['message']['body']['track_list'].length, (index) => Track.fromJson(parsedJson['message']['body']['track_list'][index]['track']));
    final TrackController trackController=Get.find();
    trackController.trackList.addAll(updatedList);
  }

  void updateTrack(Map<String, dynamic> parsedJson) async {
    Track updatedTrack=Track.fromJson(parsedJson['message']['body']['track']);
    final TrackController trackController=Get.find();
    trackController.track.value=updatedTrack;
  }

  void updateLyrics(Map<String, dynamic> parsedJson) async {
    lyrics.value=parsedJson['message']['body']['lyrics']['lyrics_body'];
  }
}