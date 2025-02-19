import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [FavoriteSong])
abstract class AppDatabase extends FloorDatabase {
  FavoriteSongDao get favoriteSongDao;
}
