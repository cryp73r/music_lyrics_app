class MusicGenre {
  int? music_genre_id;
  int? music_genre_parent_id;
  String? music_genre_name;
  String? music_genre_name_extended;
  String? music_genre_vanity;

  MusicGenre({this.music_genre_id=0, this.music_genre_parent_id=0, this.music_genre_name="", this.music_genre_name_extended="", this.music_genre_vanity=""});

  MusicGenre.fromJson(Map<String, dynamic> parsedJson) {
    music_genre_id=parsedJson['music_genre_id'];
    music_genre_parent_id=parsedJson['music_genre_parent_id'];
    music_genre_name=parsedJson['music_genre_name'];
    music_genre_name_extended=parsedJson['music_genre_name_extended'];
    music_genre_vanity=parsedJson['music_genre_vanity'];
  }
}