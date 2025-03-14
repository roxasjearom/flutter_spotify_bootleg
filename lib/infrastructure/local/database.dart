import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [FavoriteTrack])
abstract class AppDatabase extends FloorDatabase {
  FavoriteTrackDao get favoriteSongDao;
}
