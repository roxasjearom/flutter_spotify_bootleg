import 'package:equatable/equatable.dart';

final class HeaderDetails extends Equatable {
  const HeaderDetails({
    required this.id,
    required this.name,
    required this.artist,
    required this.imageUrl,
    required this.subHeaderValue,
  });

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final String? subHeaderValue;

  @override
  List<Object> get props => [id, name, artist, imageUrl];
}
