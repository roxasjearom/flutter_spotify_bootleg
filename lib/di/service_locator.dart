import 'package:flutter_spotify_bootleg/data/repository/home_repository_impl.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initLocator() {
  getIt.registerLazySingleton<HomeRepository>(() => FakeHomeRepositoryImpl());
}
