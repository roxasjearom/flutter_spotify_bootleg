import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData spotifyTheme = ThemeData(
  // Main theme settings
  scaffoldBackgroundColor: spotifyBlack, 
  primaryColor: spotifyGreen, 
  colorScheme: ColorScheme.dark(
    primary: spotifyGreen,
    secondary: spotifyLightGrey,
    surface: spotifyGrey,
    onPrimary: spotifyWhite,
    onSecondary: spotifyBlack,
    onSurface: spotifyWhite, 
    error: Colors.red,
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: spotifyBlack,
    titleTextStyle: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: spotifyWhite,
    ),
  ),

  // Text Theme
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: spotifyWhite),
    bodyMedium: TextStyle(color: spotifyLightGrey),
    bodySmall: TextStyle(color: spotifyLightGrey),
    headlineLarge: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: spotifyWhite,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: spotifyGreen,
      foregroundColor: spotifyWhite,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
    outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: spotifyWhite,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
        side: const BorderSide(color: spotifyGreen),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: spotifyGreen
      )
  ),
);
