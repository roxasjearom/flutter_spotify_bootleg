import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/database.dart';
import 'package:flutter_spotify_bootleg/data/remote/authentication/authentication_service.dart';
import 'package:flutter_spotify_bootleg/data/remote/authentication/token_interceptor.dart';
import 'package:flutter_spotify_bootleg/data/remote/authentication/token_manager.dart';
import 'package:flutter_spotify_bootleg/data/remote/spotify_service.dart';
import 'package:flutter_spotify_bootleg/data/repository/home_repository_impl.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

const spotifyUrl = "https://api.spotify.com/";
const accountsUrl = "https://accounts.spotify.com/";
const clientId = "CLIENT_ID";
const clientSecret = "CLIENT_SECRET";

Future<void> initLocator() async {
  //Local Database
  getIt.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase.databaseBuilder('my_database.db').build();
  });

  getIt.registerSingletonWithDependencies<FavoriteSongDao>(
      () => getIt<AppDatabase>().favoriteSongDao,
      dependsOn: [AppDatabase]);

  //Authentication Service
  getIt.registerSingletonAsync<AuthenticationService>(() async {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final credentials = "$clientId:$clientSecret";
        final base64Credentials = base64.encode(utf8.encode(credentials));

        options.headers["Content-Type"] = "application/x-www-form-urlencoded";
        options.headers["Authorization"] = "Basic $base64Credentials";

        return handler.next(options);
      },
    ));
    return AuthenticationService(dio, baseUrl: accountsUrl);
  });

  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  //Spotify service
  getIt.registerSingletonWithDependencies<SpotifyService>(() {
    final dio = Dio();
    final TokenManager tokenManager =
        TokenManager(sharedPreference: getIt.get<SharedPreferences>());
    final TokenInterceptor tokenInterceptor =
        TokenInterceptor(tokenManager, getIt.get<AuthenticationService>());

    dio.interceptors.add(tokenInterceptor);
    return SpotifyService(dio, baseUrl: spotifyUrl);
  },
  dependsOn: [SharedPreferences, AuthenticationService]);

  getIt.registerSingletonWithDependencies<HomeRepository>(
      () => HomeRepositoryImpl(
          getIt.get<FavoriteSongDao>(), 
          getIt.get<AuthenticationService>(),
          getIt.get<SpotifyService>(),
          ),
      dependsOn: [FavoriteSongDao, AuthenticationService, SpotifyService]);
}
