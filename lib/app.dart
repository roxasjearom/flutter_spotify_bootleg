import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/presentation/home/home_screen.dart';
import 'package:flutter_spotify_bootleg/presentation/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify-Bootleg',
      theme: spotifyTheme,
      home: FutureBuilder(
            future: serviceLocator.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
    );
  }
}
