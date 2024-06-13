import 'package:bbs_project/Model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer? _player;
  Song? _currentSong;

  AudioProvider() {
    _player = AudioPlayer();
  }

  Future<void> setSong(Song song) async {
    if (_currentSong == song) return;
    await _player?.stop();
    _currentSong = song;
    await _player?.setUrl(song.url);
    await _player?.play();
    notifyListeners();
  }

  void play() async {
    await _player?.play();
    notifyListeners();
  }

  void pause() async {
    await _player?.pause();
    notifyListeners();
  }

  bool get isPlaying => _player?.playing ?? false;

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }
}
