import 'package:equatable/equatable.dart';

final class Artist extends Equatable {
  const Artist({required this.id, required this.name, required this.imageUrl});

  final String id;
  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [id, name, imageUrl];
}
