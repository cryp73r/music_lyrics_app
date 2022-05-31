import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/utils.dart';
import '../controllers/track_controller.dart';

Future<int> getTracks() async {
  String url="https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$apiKey";
  http.Response response=await http.get(Uri.parse(url));
  final TrackController trackController=Get.find();
  trackController.addTracks(json.decode(response.body));
  return response.statusCode;
}

Future<int> getTrackDetails(int trackId) async {
  String url="https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=$apiKey";
  http.Response response=await http.get(Uri.parse(url));
  final TrackController trackController=Get.find();
  trackController.updateTrack(json.decode(response.body));
  return response.statusCode;
}

Future<int> getLyrics(int trackId) async {
  String url="https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=$apiKey";
  http.Response response=await http.get(Uri.parse(url));
  await getTrackDetails(trackId);
  final TrackController trackController=Get.find();
  trackController.updateLyrics(json.decode(response.body));
  return response.statusCode;
}