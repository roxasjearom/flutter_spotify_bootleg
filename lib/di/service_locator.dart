import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/database.dart';
import 'package:flutter_spotify_bootleg/data/repository/home_repository_impl.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> initLocator() async {
  //Local Database
  getIt.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase.databaseBuilder('my_database.db').build();
  });

  getIt.registerSingletonWithDependencies<FavoriteSongDao>(
      () => getIt<AppDatabase>().favoriteSongDao,
      dependsOn: [AppDatabase]);

  getIt.registerSingletonWithDependencies<HomeRepository>(() => FakeHomeRepositoryImpl(getIt.get<FavoriteSongDao>()), dependsOn: [FavoriteSongDao]);
}
