import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/ui/home/home_screen.dart';
import 'package:flutter_spotify_bootleg/ui/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify-Bootleg',
      theme: spotifyTheme,
      home: FutureBuilder(
            future: getIt.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return CircularProgressIndicator();
              }
            }),
    );
  }
}
