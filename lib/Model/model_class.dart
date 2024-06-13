
class Song {

  String title;
  String url;

  Song({
    required this.title,
    required this.url
});

  factory Song.fromJson(Map<String, dynamic> json)
  {
    return switch(json)
    {

      {
        'title' : String title,
        'url' : String url
    } => Song(title: title, url: url)
    , _ => throw const FormatException('Failed to load album.'),
    };
  }


}