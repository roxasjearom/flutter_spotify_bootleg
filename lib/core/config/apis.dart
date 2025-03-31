class Apis {
  static const String spotifyUrl = "https://api.spotify.com/";
  static const String accountsUrl = "https://accounts.spotify.com/";

  static const String apiVersion = "v1";

  static const String token = "/api/token";

  static const String categories = "$apiVersion/browse/categories";
  static const String albums = "$apiVersion/albums";
  static const String albumDetails = "$apiVersion/albums/{id}";
  static const String artists = "$apiVersion/artists";
  static const String artistTopTracks = "$apiVersion/artists/{id}/top-tracks";
  static const String artistDetails = "$apiVersion/artists/{id}";
}
