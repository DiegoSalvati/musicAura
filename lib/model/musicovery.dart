import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Musicovery {
  Musicovery({
    required this.request,
    required this.response,
    required this.infos,
    required this.tracks,
    required this.played,
    required this.favonot,
  });
  late final Request request;
  late final Response response;
  late final Infos infos;
  late final Tracks tracks;
  late final String played;
  late final Favonot favonot;

  Musicovery.fromJson(Map<String, dynamic> json) {
    request = Request.fromJson(json['request']);
    response = Response.fromJson(json['response']);
    infos = Infos.fromJson(json['infos']);
    tracks = Tracks.fromJson(json['tracks']);
    played = json['played'];
    favonot = Favonot.fromJson(json['favonot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['request'] = request.toJson();
    _data['response'] = response.toJson();
    _data['infos'] = infos.toJson();
    _data['tracks'] = tracks.toJson();
    _data['played'] = played;
    _data['favonot'] = favonot.toJson();
    return _data;
  }
}

class Request {
  Request({
    required this.fct,
    required this.popularitymax,
    required this.popularitymin,
    required this.starttrackid,
    required this.date70,
    required this.trackvalence,
    required this.trackarousal,
    required this.resultsnumber,
    required this.listenercountry,
  });
  late final String fct;
  late final String popularitymax;
  late final String popularitymin;
  late final Starttrackid starttrackid;
  late final String date70;
  late final String trackvalence;
  late final String trackarousal;
  late final String resultsnumber;
  late final String listenercountry;

  Request.fromJson(Map<String, dynamic> json) {
    fct = json['fct'];
    popularitymax = json['popularitymax'];
    popularitymin = json['popularitymin'];
    starttrackid = Starttrackid.fromJson(json['starttrackid']);
    date70 = json['date70'];
    trackvalence = json['trackvalence'];
    trackarousal = json['trackarousal'];
    resultsnumber = json['resultsnumber'];
    listenercountry = json['listenercountry'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fct'] = fct;
    _data['popularitymax'] = popularitymax;
    _data['popularitymin'] = popularitymin;
    _data['starttrackid'] = starttrackid.toJson();
    _data['date70'] = date70;
    _data['trackvalence'] = trackvalence;
    _data['trackarousal'] = trackarousal;
    _data['resultsnumber'] = resultsnumber;
    _data['listenercountry'] = listenercountry;
    return _data;
  }
}

class Starttrackid {
  Starttrackid();

  Starttrackid.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Response {
  Response({
    required this.code,
    required this.anwser,
    required this.time,
  });
  late final String code;
  late final String anwser;
  late final String time;

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    anwser = json['anwser'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['anwser'] = anwser;
    _data['time'] = time;
    return _data;
  }
}

class Infos {
  Infos({
    required this.id,
    required this.radioName,
    required this.radioType,
  });
  late final Id id;
  late final RadioName radioName;
  late final RadioType radioType;

  Infos.fromJson(Map<String, dynamic> json) {
    id = Id.fromJson(json['id']);
    radioName = RadioName.fromJson(json['radio_name']);
    radioType = RadioType.fromJson(json['radio_type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id.toJson();
    _data['radio_name'] = radioName.toJson();
    _data['radio_type'] = radioType.toJson();
    return _data;
  }
}

class Id {
  Id();

  Id.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class RadioName {
  RadioName();

  RadioName.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class RadioType {
  RadioType();

  RadioType.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Tracks with ChangeNotifier {
  Tracks();
//  Tracks({
//    required this.track,
//  });
  late List<Track> track;

  Tracks.fromJson(Map<String, dynamic> json) {
    track = List.from(json['track']).map((e) => Track.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['track'] = track.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Track with ChangeNotifier {
  Track({
    this.id,
    this.title,
    this.artistDisplayName,
    this.artists,
    this.releasedate,
    this.genre,
    this.arousal,
    this.valence,
    this.popularity,
    this.isFavorite = false,
  });
  late final String? id;
  String? title;
  late final String? artistDisplayName;
  Artists? artists;
  late final String? releasedate;
  late final String? genre;
  late final String? arousal;
  late final String? valence;
  late final String? popularity;
  bool? isFavorite;

  List<Track> _tracks = [];

  List<Track> get tracks => _tracks;

  void toggleFavoriteStatus(Track track) {
    final isFavorite = _tracks.contains(track);
    if (isFavorite) {
      _tracks.remove(track);
    } else {
      _tracks.add(track);
    }
    notifyListeners();
  }

  void removeTrack(String id) {
    _tracks.remove(id);
    notifyListeners();
  }

  bool isFavoriteStatus(Track track) {
    final isFavorite = _tracks.contains(track);
    return isFavorite;
  }

  Track.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    artistDisplayName = json['artist_display_name'];
    artists = Artists.fromJson(json['artists']);
    releasedate = json['releasedate'];
    genre = json['genre'];
    arousal = json['arousal'];
    valence = json['valence'];
    popularity = json['popularity'];
    isFavorite = json['favorite'] == 1;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['artist_display_name'] = artistDisplayName;
    _data['artists'] = artists!.toJson();
    _data['releasedate'] = releasedate;
    _data['genre'] = genre;
    _data['arousal'] = arousal;
    _data['valence'] = valence;
    _data['popularity'] = popularity;
    _data['favorite'] = this.isFavorite! ? 1 : 0;
    return _data;
  }
}

class Artists {
  Artists({
    this.artist,
  });
  late final Artist? artist;

  Artists.fromJson(Map<String, dynamic> json) {
    artist = Artist.fromJson(json['artist']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['artist'] = artist!.toJson();
    return _data;
  }
}

class Artist {
  Artist({
    this.mbid,
    this.name,
    this.genre,
  });
  late final String? mbid;
  String? name;
  late final String? genre;

  Artist.fromJson(Map<String, dynamic> json) {
    mbid = json['mbid'];
    name = json['name'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mbid'] = mbid;
    _data['name'] = name;
    _data['genre'] = genre;
    return _data;
  }
}

class Favonot {
  Favonot();

  Favonot.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
