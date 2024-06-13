import 'package:bbs_project/API/API_class.dart';
import 'package:bbs_project/Model/model_class.dart';
import 'package:bbs_project/Player_State/player_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => AudioProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Song>>? _songs;

  @override
  void initState() {
    super.initState();
    _songs = fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      body: FutureBuilder<List<Song>>(
        future: _songs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final songs = snapshot.data!;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song.title),
                  onTap: () => audioProvider.setSong(song),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(audioProvider.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () => audioProvider.isPlaying ? audioProvider.pause() : audioProvider.play(),
          ),
        ],
      ),
    );
  }
}
