import 'dart:convert';
import 'package:bbs_project/Model/model_class.dart';
import 'package:http/http.dart' as http;



/*

Future<List<SongModel>> fetchSongs() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/0bfb4c1e-a836-48f5-9426-bcc24268482b'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => SongModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load songs');
  }
}


 */



Future<List<Song>> fetchSongs() async {
  // Replace with your actual API call
  final response = await http.get(Uri.parse("https://mocki.io/v1/35b915ed-2fa7-4006-b72c-808a15ebcf1e"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data.map((song) => Song.fromJson(song)).toList();
  } else {
    throw Exception("Failed to load songs");
  }
}
