import 'package:flutter_spotify_bootleg/data/dio_client.dart';
import 'package:flutter_spotify_bootleg/data/rest_client.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initLocator() {
  final dio = buildDioClient("baseUrl"); //TODO: Add base URL here
  getIt.registerLazySingleton<RestClient>(() => RestClient(dio));
}
