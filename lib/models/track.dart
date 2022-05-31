import './music_genre.dart';

class Track {
  int? track_id;
  String? track_name;
  int? track_rating;
  int? commontrack_id;
  int? instrumental;
  int? explicit;
  int? has_lyrics;
  int? has_subtitles;
  int? has_richsync;
  int? num_favourite;
  int? album_id;
  String? album_name;
  int? artist_id;
  String? artist_name;
  String? track_share_url;
  String? track_edit_url;
  int? restricted;
  String? updated_time;
  List<MusicGenre>? music_genre_list;

  Track({this.track_id=0,
    this.track_name="",
    this.track_rating=0,
    this.commontrack_id=0,
    this.instrumental=0,
    this.explicit=0,
    this.has_lyrics=0,
    this.has_subtitles=0,
    this.has_richsync=0,
    this.num_favourite=0,
    this.album_id=0,
    this.album_name="",
    this.artist_id=0,
    this.artist_name="",
    this.track_share_url="",
    this.track_edit_url="",
    this.restricted=0,
    this.updated_time="",
  });

  Track.fromJson(Map<String, dynamic> parsedJson) {
    track_id=parsedJson['track_id'];
    track_name=parsedJson['track_name'];
    track_rating=parsedJson['track_rating'];
    commontrack_id=parsedJson['commontrack_id'];
    instrumental=parsedJson['instrumental'];
    explicit=parsedJson['explicit'];
    has_lyrics=parsedJson['has_lyrics'];
    has_subtitles=parsedJson['has_subtitles'];
    has_richsync=parsedJson['has_richsync'];
    num_favourite=parsedJson['num_favourite'];
    album_id=parsedJson['album_id'];
    album_name=parsedJson['album_name'];
    artist_id=parsedJson['artist_id'];
    artist_name=parsedJson['artist_name'];
    track_share_url=parsedJson['track_share_url'];
    track_edit_url=parsedJson['track_edit_url'];
    restricted=parsedJson['restricted'];
    updated_time=parsedJson['updated_time'];
    music_genre_list=List.generate(parsedJson['primary_genres']['music_genre_list'].length, (index) => MusicGenre.fromJson(parsedJson['primary_genres']['music_genre_list'][index]['music_genre']));
  }
}