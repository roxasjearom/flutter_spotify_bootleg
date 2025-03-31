import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/env/env.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/database.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/service/authentication_service.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/authentication/token_interceptor.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/authentication/token_manager.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/service/spotify_service.dart';
import 'package:flutter_spotify_bootleg/infrastructure/repository/favorites_repository_impl.dart';
import 'package:flutter_spotify_bootleg/infrastructure/repository/spotify_repository_impl.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

const clientId = Env.clientId;
const clientSecret = Env.clientSecret;

Future<void> initLocator() async {
  //Local Database
  getIt.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase.databaseBuilder('my_database.db').build();
  });

  getIt.registerSingletonWithDependencies<FavoriteTrackDao>(
      () => getIt<AppDatabase>().favoriteTrackDao,
      dependsOn: [AppDatabase]);

  //Authentication Service
  getIt.registerSingletonAsync<AuthenticationService>(() async {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final credentials = "$clientId:$clientSecret";
        final base64Credentials = base64.encode(utf8.encode(credentials));

        options.headers["Content-Type"] = Env.contentType;
        options.headers["Authorization"] = "Basic $base64Credentials";

        return handler.next(options);
      },
    ));
    return AuthenticationService(dio, baseUrl: Env.accountsUrl);
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
    return SpotifyService(dio, baseUrl: Env.spotifyUrl);
  }, dependsOn: [SharedPreferences, AuthenticationService]);

  getIt.registerSingletonWithDependencies<SpotifyRepository>(
      () => SpotifyRepositoryImpl(
            getIt.get<SpotifyService>(),
            getIt.get<FavoriteTrackDao>(),
          ),
      dependsOn: [SpotifyService, FavoriteTrackDao]);

  getIt.registerSingletonWithDependencies<FavoritesRepository>(
      () => FavoritesRepositoryImpl(
            getIt.get<FavoriteTrackDao>(),
          ),
      dependsOn: [FavoriteTrackDao]);
}
