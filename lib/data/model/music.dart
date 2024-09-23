class Music {
  String? id, name, uper, imgUrl, url;
  Music({this.id, this.name, this.uper, this.imgUrl, this.url});

  Music.fromJson(Map<dynamic, dynamic> e){
    id = e["ID"];
    name = e["Name"];
    uper = e["Username"][0];
    url = e["MusicFile"][0]["url"];
    imgUrl = e["Image"][0]["url"];
  }
}