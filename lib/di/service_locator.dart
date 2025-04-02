import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/domain/enumerations/source_type.dart';
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
import 'package:flutter_spotify_bootleg/presentation/categorylist/bloc/category_list_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/album/bloc/album_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/artist/bloc/artist_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/category/bloc/category_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/playlist/bloc/playlist_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/bloc/track_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/favoritelist/bloc/favorite_list_bloc.dart';

GetIt serviceLocator = GetIt.instance;

const clientId = Env.clientId;
const clientSecret = Env.clientSecret;

Future<void> initLocator() async {
  //Local Database
  serviceLocator.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase.databaseBuilder('my_database.db').build();
  });

  serviceLocator.registerSingletonWithDependencies<FavoriteTrackDao>(
      () => serviceLocator<AppDatabase>().favoriteTrackDao,
      dependsOn: [AppDatabase]);

  //Authentication Service
  serviceLocator.registerSingletonAsync<AuthenticationService>(() async {
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

  serviceLocator.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  //Spotify service
  serviceLocator.registerSingletonWithDependencies<SpotifyService>(() {
    final dio = Dio();
    final TokenManager tokenManager =
        TokenManager(sharedPreference: serviceLocator<SharedPreferences>());
    final TokenInterceptor tokenInterceptor =
        TokenInterceptor(tokenManager, serviceLocator<AuthenticationService>());

    dio.interceptors.add(tokenInterceptor);
    return SpotifyService(dio, baseUrl: Env.spotifyUrl);
  }, dependsOn: [SharedPreferences, AuthenticationService]);

  serviceLocator.registerSingletonWithDependencies<SpotifyRepository>(
      () => SpotifyRepositoryImpl(
            serviceLocator<SpotifyService>(),
            serviceLocator<FavoriteTrackDao>(),
          ),
      dependsOn: [SpotifyService, FavoriteTrackDao]);

  serviceLocator.registerSingletonWithDependencies<FavoritesRepository>(
      () => FavoritesRepositoryImpl(
            serviceLocator<FavoriteTrackDao>(),
          ),
      dependsOn: [FavoriteTrackDao]);

  //Blocs
  serviceLocator.registerFactory(() => CategoryListBloc(spotifyRepository: serviceLocator<SpotifyRepository>()));
  serviceLocator.registerFactory(() => FavoriteListBloc(favoritesRepository: serviceLocator<FavoritesRepository>()));
  serviceLocator.registerFactory(() => AlbumBloc(spotifyRepository: serviceLocator<SpotifyRepository>()));
  serviceLocator.registerFactory(() => ArtistBloc(spotifyRepository: serviceLocator<SpotifyRepository>()));
  serviceLocator.registerFactory(() => CategoryBloc(spotifyRepository: serviceLocator<SpotifyRepository>()));
  serviceLocator.registerFactory(() => FavoriteBloc(favoritesRepository: serviceLocator<FavoritesRepository>()));
  serviceLocator.registerFactory(() => PlaylistBloc(spotifyRepository: serviceLocator<SpotifyRepository>()));
  serviceLocator.registerFactoryParam<TrackListBloc, String, SourceType>(
    (id, sourceType) => TrackListBloc(
      id: id,
      sourceType: sourceType,
      spotifyRepository: serviceLocator<SpotifyRepository>(),
      favoritesRepository: serviceLocator<FavoritesRepository>(),
    ),
  );
}
