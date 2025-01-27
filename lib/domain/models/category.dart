import 'package:equatable/equatable.dart';

final class Category extends Equatable {
  const Category({required this.id, required this.name, required this.iconUrl});

  final String id;
  final String name;
  final String iconUrl;

  @override
  List<Object> get props => [id, name, iconUrl];
}