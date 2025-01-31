import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';

import 'app.dart';

void main() {
  initLocator();
  runApp(const App());
}