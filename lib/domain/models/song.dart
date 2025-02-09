import 'package:equatable/equatable.dart';
 
final class Song extends Equatable {
  const Song({required this.id, required this.title, required this.artist});
 
  final String id;
  final String title;
  final String artist;
 
  @override
  List<Object> get props => [id, title, artist];
}
